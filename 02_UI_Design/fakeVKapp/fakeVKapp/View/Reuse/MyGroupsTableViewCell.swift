//
//  MyGroupsTableViewCell.swift
//  fakeVKapp
//
//  Created by Evgeny Alekseev on 29.08.2021.
//

import UIKit

class MyGroupsTableViewCell: UITableViewCell {

    @IBOutlet var myGroupsImageView: UIImageView!
    @IBOutlet var myGroupsLabel: UILabel!
    
    func configure(with group: Group) {
        myGroupsImageView.image = group.image
        myGroupsLabel.text = group.name
    }
    
}
