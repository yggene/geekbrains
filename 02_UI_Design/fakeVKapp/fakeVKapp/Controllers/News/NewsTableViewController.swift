//
//  NewsTableViewController.swift
//  fakeVKapp
//
//  Created by Evgeny Alekseev on 12.09.2021.
//

import UIKit
import Nuke

class NewsTableViewController: UITableViewController {
    
    // MARK: Variables
    
    private let networkService = NetworkService()
    private var myNews = [News]() {
        didSet {
            tableView.reloadData()
        }
    }
    private var newsProfiles = [User]()
    private var newsCommunities = [Community]()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(NewsFooterView.self,
                           forHeaderFooterViewReuseIdentifier: "footerView")
        
        tableView.register(NewsHeaderView.self,
                           forHeaderFooterViewReuseIdentifier: "headerView")
        
        tableView.separatorStyle = .none
        
        fetchNews()
        
    }
    
    private func fetchNews() {
        networkService.getNews { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let myNews):
                self.myNews = myNews.items //.filter({ $0.markedAsAds == 0 })
                self.newsProfiles = myNews.profiles
                self.newsCommunities = myNews.groups
            case .failure(let requestError):
                switch requestError {
                case .invalidUrl:
                    print("Error: Invalid URL detected")
                case .errorDecode:
                    print("Error: Decode problem. Check the JSON data")
                case .failedRequest:
                    print("Error: Request failed")
                case .unknownError:
                    print("Error: Unknown")
                case .realmSaveFailure:
                    print("Error: Could not save to Realm")
                }
            }
        }
        self.tableView.reloadData()
    }
}

extension NewsTableViewController {
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        myNews.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    override func tableView(_ tableView: UITableView,
                            cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "newsCell", for: indexPath) as? NewsTableViewCell else { return UITableViewCell() }
        
        let currentNews = myNews[indexPath.section]
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
    
    // MARK: Header & Footer config
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let view = tableView.dequeueReusableHeaderFooterView(withIdentifier: "headerView") as? NewsHeaderView else { return UIView() }
        
        view.configure(with: myNews[section])
        
        if myNews[section].sourceId > 0 {
            Nuke.loadImage(with: newsProfiles.first(where: { $0.id == myNews[section].sourceId })?.avatarURL, into: view.avatar)
            view.nameLabel.text = newsProfiles.first(
                where: { $0.id == myNews[section].sourceId })!
                .firstName + " " + newsProfiles.first(
                    where: { $0.id == myNews[section].sourceId })!.lastName
        } else {
            Nuke.loadImage(with: newsCommunities.first(where: { $0.id == -myNews[section].sourceId })?.photoURL, into: view.avatar)
            view.nameLabel.text = newsCommunities.first(where: { $0.id == -myNews[section].sourceId })?.name
        }
        
        return view
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        60.0
    }
    
    override func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        guard let view = tableView.dequeueReusableHeaderFooterView(withIdentifier: "footerView") as? NewsFooterView else { return UIView() }
        
        view.configure(with: myNews[section])
        
        return view
        
    }
    
    override func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        60.0
    }
    
}
