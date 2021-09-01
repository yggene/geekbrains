//
//  AllGroupsTableViewCell.swift
//  fakeVKapp
//
//  Created by Evgeny Alekseev on 29.08.2021.
//

import UIKit

class AllGroupsTableViewCell: UITableViewCell {
    
    @IBOutlet var allGroupsImageView: UIImageView!
    @IBOutlet var allGroupsNameLabel: UILabel!
    
    func configure(with group: Group) {
        allGroupsImageView.image = group.image
        allGroupsNameLabel.text = group.name
    }
}
