//
//  MyGroupsTableViewController.swift
//  fakeVKapp
//
//  Created by Evgeny Alekseev on 27.08.2021.
//

import UIKit
import RealmSwift

class MyGroupsTableViewController: UITableViewController {
    
    private let networkService = NetworkService()
    private var myGroups = [Group]() {
        didSet {
            tableView.reloadData()
        }
    }
    
    // MARK: Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchMyGroupsInfo()
        tableView.separatorStyle = .none
    }
    
    // MARK: Actions
    
    private func fetchMyGroupsInfo() {
        networkService.getGroups { [weak self] myGroups in
            guard let self = self else { return }
            self.myGroups = myGroups
            self.saveGroupsData(myGroups)
        }
    }
    
    private func saveGroupsData(_ groups: [Group]) {
        do {
            let realm = try Realm()
            try! realm.write() {
                realm.add(groups, update: .all)
            }
        } catch {
            print(error)
        }
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
        
        return cell
    }
    
    // selecting cell
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
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
                let selectedGroup = allGroupsController.popularGroups[indexPath.row]
                // check if no such group in my list
                if !myGroups.contains(selectedGroup) {
                    let networkService = NetworkService()
                    networkService.joinGroup(withID: selectedGroup.id, completion: { result in
                        switch result {
                        case .success:
                            print("Joined!")
                            self.myGroups.append(selectedGroup)
                        case .failure:
                            print("Already in the group")
                        }
                    })
                }
            }
        }
    }
}
