//
//  FriendCell.swift
//  fakeVKapp
//
//  Created by Evgeny Alekseev on 30.08.2021.
//

import UIKit
import Nuke

class FriendTableViewCell: UITableViewCell {
    
    @IBOutlet var avatarImageView: AvatarImage!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var originLabel: UILabel!
    
    func configure(with friend: Friend) {
        Nuke.loadImage(with: friend.avatarURL, into: avatarImageView)
        nameLabel?.text = friend.firstName + " " + friend.lastName
        originLabel?.text = friend.city?.title ?? "🌎"
        
        // cell style
        accessoryType = .disclosureIndicator
        originLabel?.textColor = UIColor.systemGray
    }
    
//    override class func awakeFromNib() {
//        // add animation here
//    }
    
}
