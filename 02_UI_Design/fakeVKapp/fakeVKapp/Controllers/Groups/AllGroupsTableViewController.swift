//
//  AllGroupsTableViewController.swift
//  fakeVKapp
//
//  Created by Evgeny Alekseev on 27.08.2021.
//

import UIKit

class AllGroupsTableViewController: UITableViewController, UISearchBarDelegate {
    
    private var popularGroups = [Group]()
    private let networkService = NetworkService()
    
    // MARK: Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.separatorStyle = .none
        
        popularGroups = updateAllGroups(with: nil)
        
        self.hideKeyboardWhenTappedAround()
        
        networkService.getPopularGroups() { [weak self] popularGroups in
            guard let self = self else { return }
            self.popularGroups = popularGroups
        }
        
    }
    
    // MARK: Table view data source
    
    private func updateAllGroups(with searchText: String?) -> [Group]{
        var groupsCopy = popularGroups
        if let text = searchText?.lowercased(), searchText != "" {
            groupsCopy = groupsCopy.filter{ $0.name.lowercased().contains(text) }
        }
        
        return groupsCopy
    }
    
    internal func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        popularGroups = updateAllGroups(with: searchText)
        tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView,
                            numberOfRowsInSection section: Int) -> Int {
        popularGroups.count
    }
    
    override func tableView(_ tableView: UITableView,
                            cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
                withIdentifier: "allGroupsTableViewCell",
                for: indexPath) as? AllGroupsTableViewCell else { return UITableViewCell() }
        
        let currentGroup = popularGroups[indexPath.row]
        cell.configure(with: currentGroup)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}
