//
//  SongSearchViewController.swift
//  iOSArchitecturesDemo
//
//  Created by Evgeny Alekseev on 19.01.2022.
//  Copyright © 2022 ekireev. All rights reserved.
//

import UIKit

final class SongSearchViewController: UIViewController {
    
    // MARK: - Private Properties
    
    private let presenter: SongSearchViewOutput
    
    init(presenter: SongSearchViewOutput) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private var searchView: SearchViewInterface {
        return self.view as! SearchViewInterface
    }
    
    private let searchService = ITunesSearchService()
    var searchResults = [ITunesSong]() {
        didSet {
            self.searchView.tableView.isHidden = false
            self.searchView.tableView.reloadData()
            self.searchView.searchBar.resignFirstResponder()
        }
    }
    
    private struct Constants {
        static let reuseIdentifier = "reuseId"
    }
    
    // MARK: - Lifecycle
    
    override func loadView() {
        super.loadView()
        self.view = SearchViewInterface()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.searchView.searchBar.delegate = self
        self.searchView.tableView.register(SongCell.self, forCellReuseIdentifier: Constants.reuseIdentifier)
        self.searchView.tableView.delegate = self
        self.searchView.tableView.dataSource = self
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.throbber(show: false)
    }
}

//MARK: - UITableViewDataSource
extension SongSearchViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchResults.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let dequeuedCell = tableView.dequeueReusableCell(withIdentifier: Constants.reuseIdentifier, for: indexPath)
        guard let cell = dequeuedCell as? SongCell else {
            return dequeuedCell
        }
        let song = self.searchResults[indexPath.row]
        let cellModel = SongCellModelFactory.cellModel(from: song)
        cell.configure(with: cellModel)
        return cell
    }
}

//MARK: - UITableViewDelegate
extension SongSearchViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let song = searchResults[indexPath.row]
        self.presenter.viewDidSelectSong(song)
    }
}

//MARK: - UISearchBarDelegate
extension SongSearchViewController: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let query = searchBar.text else {
            searchBar.resignFirstResponder()
            return
        }
        if query.count == 0 {
            searchBar.resignFirstResponder()
            return
        }
        self.presenter.viewDidSearch(with: query)
    }
}

// MARK: - Input
extension SongSearchViewController: SongSearchViewInput {
    
    func showError(error: Error) {
        let alert = UIAlertController(title: "Error", message: "\(error.localizedDescription)", preferredStyle: .alert)
        let actionOk = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alert.addAction(actionOk)
        self.present(alert, animated: true, completion: nil)
    }
    
    func showNoResults() {
        self.searchView.emptyResultView.isHidden = false
        self.searchResults = []
        self.searchView.tableView.reloadData()
    }
    
    func hideNoResults() {
        self.searchView.emptyResultView.isHidden = true
    }
    
    func throbber(show: Bool) {
        UIApplication.shared.isNetworkActivityIndicatorVisible = show
    }
}
