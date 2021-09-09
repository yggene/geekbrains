//
//  AllGroupsTableViewController.swift
//  fakeVKapp
//
//  Created by Evgeny Alekseev on 27.08.2021.
//

import UIKit

class AllGroupsTableViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView,
                            numberOfRowsInSection section: Int) -> Int {
        allGroups.count
    }
    
    override func tableView(_ tableView: UITableView,
                            cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
                withIdentifier: "allGroupsTableViewCell",
                for: indexPath) as? AllGroupsTableViewCell else { return UITableViewCell() }
        
        let currentGroup = allGroups[indexPath.row]
        cell.configure(with: currentGroup)
        
        // Cell style
        tableView.separatorStyle = .none
        cell.allGroupsImageView?.layer.masksToBounds = true
        cell.allGroupsImageView?.layer.cornerRadius = 10
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView,
                            didSelectRowAt indexPath: IndexPath) {
        
        defer { tableView.deselectRow(
            at: indexPath,
            animated: true) }
        
    }
    
}
