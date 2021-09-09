//
//  MyGroupsTableViewController.swift
//  fakeVKapp
//
//  Created by Evgeny Alekseev on 27.08.2021.
//

import UIKit

class MyGroupsTableViewController: UITableViewController {
    
    // MARK: Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    // MARK: Table view data source
    
    override func tableView(_ tableView: UITableView,
                            numberOfRowsInSection section: Int) -> Int {
        myGroups.count
    }
    
    override func tableView(_ tableView: UITableView,
                            cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
                withIdentifier: "myGroupsCell",
                for: indexPath) as? MyGroupsTableViewCell else { return UITableViewCell() }
        
        let currentGroup = myGroups[indexPath.row]
        cell.configure(with: currentGroup)
        
        // cell style
        tableView.separatorStyle = .none
        cell.myGroupsImageView?.layer.masksToBounds = true
        cell.myGroupsImageView?.layer.cornerRadius = 10
        
        return cell
    }
    
    // selecting cell
    override func tableView(
        _ tableView: UITableView,
        didSelectRowAt indexPath: IndexPath) {
        
        // deselecting cell
        defer {
            tableView.deselectRow(at: indexPath, animated: true)
        }
        
    }
    
    // deleting groups from profile
    override func tableView(_ tableView: UITableView,
                            commit editingStyle: UITableViewCell.EditingStyle,
                            forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            myGroups.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    // MARK: Actions
    
    // add group on unwind
    @IBAction func addGroup(segue: UIStoryboardSegue) {
        // check segue id
        if segue.identifier == "addGroupSegue" {
            // get destination segue
            guard let allGroupsController = segue.source as?
                    AllGroupsTableViewController else { return }
            // get the index of the selected group cell
            if let indexPath = allGroupsController.tableView.indexPathForSelectedRow {
                // get group
                let selectedGroup = allGroups[indexPath.row]
                // check if no such group in my list
                if !myGroups.contains(selectedGroup) {
                    myGroups.append(selectedGroup)
                    tableView.reloadData()
                }
            }
        }
    }
    
}
