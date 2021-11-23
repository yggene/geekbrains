//
//  AllGroupsTableViewController.swift
//  fakeVKapp
//
//  Created by Evgeny Alekseev on 27.08.2021.
//

import UIKit

class AllGroupsTableViewController: UITableViewController, UISearchBarDelegate {
    
    public var popularGroups = [Community]()
    private var groupsSearchResult = [Community]()
    private let networkService = NetworkService()
    
    // MARK: Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.separatorStyle = .none
        self.hideKeyboardWhenTappedAround()
        
        fetchPopularGroupsInfo()
    }
    
    // MARK: Methods
    
    func fetchPopularGroupsInfo() {
        
        networkService.getPopularGroups { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let popularGroups):
                self.popularGroups = popularGroups
                self.groupsSearchResult = popularGroups
                self.tableView.reloadData()
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
    }
    
    // MARK: Table view data source
    
    private func updateAllGroups(with searchText: String?) -> [Community] {
        var groupsCopy = popularGroups
        if let text = searchText?.lowercased(), searchText != "" {
            groupsCopy = groupsCopy.filter{ $0.name.lowercased().contains(text) }
        }
        return groupsCopy
    }
    
    internal func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        groupsSearchResult = updateAllGroups(with: searchText)
        tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView,
                            numberOfRowsInSection section: Int) -> Int {
        groupsSearchResult.count
    }
    
    override func tableView(_ tableView: UITableView,
                            cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: "allGroupsTableViewCell",
            for: indexPath) as? AllGroupsTableViewCell else { return UITableViewCell() }
        
        let currentGroup = groupsSearchResult[indexPath.row]
        cell.configure(with: currentGroup)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}
