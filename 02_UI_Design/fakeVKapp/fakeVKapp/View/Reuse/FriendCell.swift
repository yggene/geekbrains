//
//  FriendCell.swift
//  fakeVKapp
//
//  Created by Evgeny Alekseev on 30.08.2021.
//

import UIKit

class FriendCell: UITableViewCell {

    @IBOutlet var avatarImageView: UIImageView!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var originLabel: UILabel!
    
    func configure(with friend: Friend) {
        avatarImageView?.image = friend.avatar
        nameLabel?.text = friend.firstName + " " + friend.secondName
        originLabel?.text = friend.origin.rawValue
    }
}
