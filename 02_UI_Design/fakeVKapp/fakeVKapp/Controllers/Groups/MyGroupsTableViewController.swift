//
//  MyGroupsTableViewController.swift
//  fakeVKapp
//
//  Created by Evgeny Alekseev on 27.08.2021.
//

import UIKit
import RealmSwift

class MyGroupsTableViewController: UITableViewController {
    
    // MARK: Variables
    
    private let networkService = NetworkService()
    private var myGroups = [Group]() {
        didSet {
            tableView.reloadData()
        }
    }
    
    // MARK: Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.separatorStyle = .none
        
        fetchMyGroupsInfo()
//        loadGroupsFromRealm()
        
    }
    
    // MARK: Actions
    
    private func loadGroupsFromRealm() {
        do {
            let groupsFromRealm = try RealmService.load(typeOf: Group.self)
            self.myGroups = Array(groupsFromRealm)
        } catch {
            print(error)
        }
    }
    
    private func fetchMyGroupsInfo() {
        networkService.getGroups { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success/*(let myGroups)*/:
                self.loadGroupsFromRealm()
//                self.myGroups = myGroups
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
    
    // MARK: Alerts
    
    private func showAlert(with: Int) {
        switch with {
        case 0:
            let alertController = UIAlertController(
                title: "Fail",
                message: "You're already in this group",
                preferredStyle: .alert)
            let alertItem = UIAlertAction(
                title: "OK",
                style: .default)
            alertController.addAction(alertItem)
            present(alertController,
                    animated: true,
                    completion: nil)
        case 1:
            let alertController = UIAlertController(
                title: "Success",
                message: "You've joined the group",
                preferredStyle: .alert)
            let alertItem = UIAlertAction(
                title: "OK",
                style: .default)
            alertController.addAction(alertItem)
            present(alertController,
                    animated: true,
                    completion: nil)
        default:
            let alertController = UIAlertController(
                title: "Error",
                message: "Something's went wrong",
                preferredStyle: .alert)
            let alertItem = UIAlertAction(
                title: "OK",
                style: .default)
            alertController.addAction(alertItem)
            present(alertController,
                    animated: true,
                    completion: nil)
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
    
    // MARK: Segue
    
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
                        case .success(let resp):
                            switch resp {
                            case nil:
                                print("Already in the group")
                                self.showAlert(with: 0)
                            case 1:
                                print("Joined!")
                                self.showAlert(with: 1)
                            default:
                                print("Unknown error. Code: \(String(describing: resp))")
                            }
                            self.myGroups.append(selectedGroup)
                        case .failure(let requestError):
                            switch requestError {
                            case .invalidUrl:
                                print("Error: Invalid URL detected")
                            case .errorDecode:
                                break
                            case .failedRequest:
                                print("Error: Request failed")
                            case .unknownError:
                                print("Error: Unknown")
                            case .realmSaveFailure:
                                print("Error: Could not save to Realm")
                            }
                            self.showAlert(with: 2)
                        }
                    })
                }
            }
        }
    }
}
