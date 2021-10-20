//
//  NewsTableViewController.swift
//  fakeVKapp
//
//  Created by Evgeny Alekseev on 12.09.2021.
//

import UIKit

class NewsTableViewController: UITableViewController {
    
    private let networkService = NetworkService()
    private var myNews = [News]() {
        didSet {
            tableView.reloadData()
        }
    }
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.separatorStyle = .none
        fetchNews()
    }
    
    private func fetchNews() {
        networkService.getNews { [weak self] myNews in
            guard let self = self else { return }
            self.myNews = myNews.filter({ $0.markedAsAds == 0 })
        }
    }
}

extension NewsTableViewController {
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        myNews.count
    }
    
    override func tableView(_ tableView: UITableView,
                            cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "newsCell", for: indexPath) as? NewsTableViewCell else { return UITableViewCell() }
        
        let currentNews = myNews[indexPath.row]
        cell.configure(with: currentNews)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func tableView(
        _ tableView: UITableView,
        heightForRowAt indexPath: IndexPath) -> CGFloat {
            return UITableView.automaticDimension
        }
    
}
