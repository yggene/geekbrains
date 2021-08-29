//
//  FriendsPhotoCollectionViewController.swift
//  fakeVKapp
//
//  Created by Evgeny Alekseev on 26.08.2021.
//

import UIKit

class FriendsPhotoCollectionViewController: UICollectionViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    // MARK: UICollectionViewDataSource

    override func collectionView(_ collectionView: UICollectionView,
                                 numberOfItemsInSection section: Int) -> Int {
        1
    }

    override func collectionView(_ collectionView: UICollectionView,
                                 cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "friendPhotoCollectionViewCell", for: indexPath) as? FriendPhotoCollectionViewCell else { return UICollectionViewCell() }
        
        cell.photoImageView?.layer.masksToBounds = true
        cell.photoImageView?.layer.cornerRadius = 50
    
        return cell
    }

    // MARK: UICollectionViewDelegate

    

}
