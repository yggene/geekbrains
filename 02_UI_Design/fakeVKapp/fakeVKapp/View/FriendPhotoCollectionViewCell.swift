//
//  FriendPhotoCollectionViewCell.swift
//  fakeVKapp
//
//  Created by Evgeny Alekseev on 26.08.2021.
//

import UIKit

class FriendPhotoCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet var photoImageView: UIImageView!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var originLabel: UILabel!
    
    func configure(with friend: Friend) {
        photoImageView.image = friend.avatar
        nameLabel.text = "Name: " + friend.firstName + " " + friend.secondName
        originLabel.text = "Origin: " + friend.origin.rawValue
    }
    
}
