//
//  FriendsTableViewController.swift
//  fakeVKapp
//
//  Created by Evgeny Alekseev on 22.08.2021.
//

import UIKit

class FriendsTableViewController: UITableViewController {
    
    var friends = [
        Friend(firstName: "Morty",
               secondName: "Smith",
               origin: .earth,
               avatar: UIImage(named: "morty-avatar")),
        Friend(firstName: "Beth",
               secondName: "Smith",
               origin: .earth,
               avatar: UIImage(named: "beth-avatar")),
        Friend(firstName: "Summer",
               secondName: "Smith",
               origin: .earth,
               avatar: UIImage(named: "summer-avatar")),
        Friend(firstName: "Bird",
               secondName: "Person",
               origin: .birdWorld,
               avatar: UIImage(named: "birdie-avatar"))
    ]
    
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
        let cell = tableView.dequeueReusableCell(
            withIdentifier: "friendCell",
            for: indexPath)
        
        // cell styles
        tableView.separatorStyle = .none
        cell.imageView?.layer.masksToBounds = true
        cell.imageView?.layer.cornerRadius = 25
        cell.accessoryType = .disclosureIndicator
        cell.detailTextLabel?.textColor = UIColor.systemGray
        
        let currentFriend = friends[indexPath.row]
        
        cell.textLabel?.text = currentFriend.firstName + " " + currentFriend.secondName
        cell.imageView?.image = currentFriend.avatar
        cell.detailTextLabel?.text = currentFriend.origin.rawValue
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        defer { tableView.deselectRow(
            at: indexPath,
            animated: true) }
        
        performSegue(withIdentifier: "friendPhotoSegue",
                     sender: nil)
        
    }
}
