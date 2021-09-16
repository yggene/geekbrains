//
//  HeaderCollectionReusableView.swift
//  fakeVKapp
//
//  Created by Evgeny Alekseev on 16.09.2021.
//

import UIKit

class HeaderCollectionReusableView: UICollectionReusableView {
        
    @IBOutlet var avatarImageView: UIImageView!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var originLabel: UILabel!
    
    func configure(with friend: Friend) {
        avatarImageView.image = friend.avatar.image
        nameLabel.text = friend.firstName + " " + friend.lastName
        originLabel.text = friend.origin.rawValue
    }
    
}
