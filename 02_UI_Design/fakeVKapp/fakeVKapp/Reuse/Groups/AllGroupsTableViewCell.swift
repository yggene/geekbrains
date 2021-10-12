//
//  AllGroupsTableViewCell.swift
//  fakeVKapp
//
//  Created by Evgeny Alekseev on 29.08.2021.
//

import UIKit
import Nuke

class AllGroupsTableViewCell: UITableViewCell {
    
    @IBOutlet var allGroupsImageView: UIImageView!
    @IBOutlet var allGroupsNameLabel: UILabel!
    
    func configure(with group: Group) {
        Nuke.loadImage(with: group.photoURL, into: allGroupsImageView)
        // allGroupsImageView.image = group.image
        allGroupsNameLabel.text = group.name
        
        // cell style
        allGroupsImageView?.layer.masksToBounds = true
        allGroupsImageView?.layer.cornerRadius = 10
        
    }
}
