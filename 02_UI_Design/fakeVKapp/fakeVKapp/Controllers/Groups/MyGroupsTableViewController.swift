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
            // load groups from Realm object
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
    
    // MARK: Alert
    
    private func showAlert(with: Int?) {
        let alertController = UIAlertController(
            title: "",
            message: "",
            preferredStyle: .alert)
        switch with {
        case nil:
            alertController.title = "Fail"
            alertController.message = "You're already in this group"
        case 1:
            alertController.title = "Success"
            alertController.message = "You've joined the group"
        default:
            alertController.title = "Error"
            alertController.message = "Something's went wrong"
        }
        
        let alertItem = UIAlertAction(
            title: "OK",
            style: .default)
        alertController.addAction(alertItem)
        present(alertController,
                animated: true,
                completion: nil)
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
                        case .success(let response):
                            switch response {
                            case nil:
                                print("Already in the group")
                                self.showAlert(with: response)
                            case 1:
                                self.myGroups.append(selectedGroup)
                                print("Joined!")
                                self.showAlert(with: response)
                            default:
                                print("Unknown error. Code: \(String(describing: response))")
                            }
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
                            self.showAlert(with: 0)
                        }
                    })
                }
            }
        }
    }
}
