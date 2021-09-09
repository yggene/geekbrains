//
//  FriendCell.swift
//  fakeVKapp
//
//  Created by Evgeny Alekseev on 30.08.2021.
//

import UIKit

class FriendTableViewCell: UITableViewCell {
    
    @IBOutlet var avatarImageView: AvatarImage!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var originLabel: UILabel!
    
    func configure(with friend: Friend) {
        avatarImageView?.image = friend.avatar
        nameLabel?.text = friend.firstName + " " + friend.lastName
        originLabel?.text = friend.origin.rawValue
        
        //tableView.separatorStyle = .none
        accessoryType = .disclosureIndicator
        originLabel?.textColor = UIColor.systemGray
    }
}
