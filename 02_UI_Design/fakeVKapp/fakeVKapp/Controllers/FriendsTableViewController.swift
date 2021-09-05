//
//  FriendsTableViewController.swift
//  fakeVKapp
//
//  Created by Evgeny Alekseev on 22.08.2021.
//

import UIKit

class FriendsTableViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView,
                            numberOfRowsInSection section: Int) -> Int {
        friends.count
    }
    
    override func tableView(_ tableView: UITableView,
                            cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
                withIdentifier: "friendCell",
                for: indexPath) as? FriendTableViewCell else { return UITableViewCell() }
        
        let currentFriend = friends[indexPath.row]
        cell.configure(with: currentFriend)
        
        // cell styles
        tableView.separatorStyle = .none
        cell.accessoryType = .disclosureIndicator
        cell.originLabel?.textColor = UIColor.systemGray
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        defer { tableView.deselectRow(
            at: indexPath,
            animated: true) }
        
        performSegue(withIdentifier: "friendPhotoSegue",
                     sender: nil)
        
    }
    
    // transfer data for the segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // check the destination controller
        guard let destinationController = segue.destination
                as? FriendsPhotoCollectionViewController
        else { return }
        
        // get the inde of the selected cell
        if let index = tableView.indexPathForSelectedRow {
            // assign profile to the destination controller
            destinationController.friendProfile = friends[index.row]
        }
    }
}
