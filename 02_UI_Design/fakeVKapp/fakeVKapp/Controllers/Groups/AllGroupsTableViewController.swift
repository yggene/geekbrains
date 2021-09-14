//
//  AllGroupsTableViewController.swift
//  fakeVKapp
//
//  Created by Evgeny Alekseev on 27.08.2021.
//

import UIKit

class AllGroupsTableViewController: UITableViewController, UISearchBarDelegate {
    
    private var allGroupsToShow = allGroups
    
    // MARK: Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.separatorStyle = .none
        
        allGroupsToShow = updateAllGroups(with: nil)
        
    }
    
    // MARK: Table view data source
    
    private func updateAllGroups(with searchText: String?) -> [Group]{
        var groupsCopy = allGroups
        if let text = searchText?.lowercased(), searchText != "" {
            groupsCopy = groupsCopy.filter{ $0.name.lowercased().contains(text) }
        }
        
        return groupsCopy
    }
    
    internal func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        allGroupsToShow = updateAllGroups(with: searchText)
        tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView,
                            numberOfRowsInSection section: Int) -> Int {
        allGroupsToShow.count
    }
    
    override func tableView(_ tableView: UITableView,
                            cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
                withIdentifier: "allGroupsTableViewCell",
                for: indexPath) as? AllGroupsTableViewCell else { return UITableViewCell() }
        
        let currentGroup = allGroupsToShow[indexPath.row]
        cell.configure(with: currentGroup)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}
