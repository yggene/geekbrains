//
//  MyGroupsTableViewCell.swift
//  fakeVKapp
//
//  Created by Evgeny Alekseev on 29.08.2021.
//

import UIKit
import Nuke

class MyGroupsTableViewCell: UITableViewCell {
    
    @IBOutlet var myGroupsImageView: UIImageView!
    @IBOutlet var myGroupsLabel: UILabel!
    
    func configure(with group: Community) {
        Nuke.loadImage(with: group.photoURL, into: myGroupsImageView)
        myGroupsLabel.text = group.name
        
        // cell style
        myGroupsImageView.layer.masksToBounds = true
        myGroupsImageView.layer.cornerRadius = 10
        
    }
    
}
