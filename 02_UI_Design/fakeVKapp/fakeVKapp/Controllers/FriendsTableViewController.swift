//
//  FriendsTableViewController.swift
//  fakeVKapp
//
//  Created by Evgeny Alekseev on 22.08.2021.
//

import UIKit

class FriendsTableViewController: UITableViewController {
    
    // MARK: Variables
    
    private var friendsDictionary: [Character:[Friend]] {
        get {
            Dictionary(grouping: friends) { $0.lastName.first ?? "👽" }
        }
    }
    private var lastNamesFirstLetters: [Character] {
        get {
            friendsDictionary.keys.sorted()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: Table view data source
    
    // number of sections
    override func numberOfSections(in tableView: UITableView) -> Int {
        friendsDictionary.keys.count
    }
    
    // number of rows in sections
    override func tableView(_ tableView: UITableView,
                            numberOfRowsInSection section: Int) -> Int {
        friendsDictionary[lastNamesFirstLetters[section]]?.count ?? 0
    }
    
    // configuring cells
    override func tableView(_ tableView: UITableView,
                            cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
                withIdentifier: "friendCell",
                for: indexPath) as? FriendTableViewCell else { return UITableViewCell() }
        
        let key = lastNamesFirstLetters[indexPath.section]
        let selectedFriends = friendsDictionary[key]
        guard let key = selectedFriends?[indexPath.row] else { return cell }
        cell.configure(with: key)
        
        // MARK: move this to configure!
        tableView.separatorStyle = .none
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        defer { tableView.deselectRow(
            at: indexPath,
            animated: true) }
        
        performSegue(withIdentifier: "friendPhotoSegue",
                     sender: nil)
    }
    
    // configuring sections' headers
    override func tableView(_ tableView: UITableView,
                            titleForHeaderInSection section: Int) -> String? {
        return String(lastNamesFirstLetters[section].uppercased())
    }
    
    // sections' headers' height
    override func tableView(_ tableView: UITableView,
                            heightForHeaderInSection section: Int) -> CGFloat {
        20.0
    }
    
    // transfer data for the segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // check the destination controller
        guard let destinationController = segue.destination
                as? FriendsPhotoCollectionViewController else { return }
        
        if let index = tableView.indexPathForSelectedRow {
            let key = lastNamesFirstLetters[index.section]
            let selectedFriends = friendsDictionary[key]
            guard let friend = selectedFriends?[index.row] else { return }
            destinationController.friendProfile = friend
        }
    }
}
