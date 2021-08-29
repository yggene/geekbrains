//
//  AllGroupsTableViewController.swift
//  fakeVKapp
//
//  Created by Evgeny Alekseev on 27.08.2021.
//

import UIKit

class AllGroupsTableViewController: UITableViewController {
    
    var allGroups = [
        Group(name: "Narnia Dimension",
              image: UIImage(named: "group-narnia-dimension")),
        Group(name: "Wasp Universe",
              image: UIImage(named: "group-wasp-universe")),
        Group(name: "Cronenberged Dimension",
              image: UIImage(named: "group-cronenberged-dimension")),
        Group(name: "Dimension C-132",
              image: UIImage(named: "group-dimension-c132")),
        Group(name: "Corn World",
              image: UIImage(named: "group-corn-world")),
        Group(name: "Froopyland",
              image: UIImage(named: "group-froopyland"))
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        allGroups.count
    }
    
    override func tableView(_ tableView: UITableView,
                            cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "allGroupsTableViewCell", for: indexPath) as? AllGroupsTableViewCell else { return UITableViewCell() }
        
        // Configure the cell...
        
        tableView.separatorStyle = .none
        cell.imageView?.layer.masksToBounds = true
        cell.imageView?.layer.cornerRadius = 5
        
        let currentGroup = allGroups[indexPath.row]
        
        cell.textLabel?.text = currentGroup.name
        cell.imageView?.image = currentGroup.image
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        defer { tableView.deselectRow(
            at: indexPath,
            animated: true) }
        
    }
    
}
