//
//  HeaderCollectionReusableView.swift
//  fakeVKapp
//
//  Created by Evgeny Alekseev on 16.09.2021.
//

import UIKit
import Nuke

class HeaderCollectionReusableView: UICollectionReusableView {
        
    @IBOutlet var avatarImageView: UIImageView!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var originLabel: UILabel!
    
    func configure(with friend: User) {
        Nuke.loadImage(with: friend.avatarURL, into: avatarImageView)
        nameLabel.text = friend.firstName + " " + friend.lastName
        originLabel.text = friend.city?.title ?? "🌎"
    }
    
}
