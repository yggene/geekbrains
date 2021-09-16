//
//  FriendPhotoCollectionViewController.swift
//  fakeVKapp
//
//  Created by Evgeny Alekseev on 26.08.2021.
//

import UIKit

class FriendPhotoCollectionViewController: UICollectionViewController,
                                            UICollectionViewDelegateFlowLayout {
    
    // MARK: Variables
    
    var friendProfile: Friend?

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    // MARK: UICollectionViewDataSource
    
    override func collectionView(_ collectionView: UICollectionView,
                                 numberOfItemsInSection section: Int) -> Int {
        friendProfile?.photos.count ?? 0
    }
    
    // cell config
    override func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: "friendPhotoCollectionViewCell",
                for: indexPath) as? FriendPhotoCollectionViewCell else {
            return UICollectionViewCell() }
        
        let photo = friendProfile?.photos[indexPath.row]
        cell.photoImageView.image = photo?.image
        
        return cell
    }
    
    // cell size config
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = view.frame.size.width
        return CGSize(width: width * 0.3, height: width * 0.3)
    }
    
    // header config
    override func collectionView(
        _ collectionView: UICollectionView,
        viewForSupplementaryElementOfKind kind: String,
        	at indexPath: IndexPath) -> UICollectionReusableView {
        switch kind {
          case UICollectionView.elementKindSectionHeader:
            let headerView = collectionView.dequeueReusableSupplementaryView(
              ofKind: kind,
              withReuseIdentifier: "friendsHeader",
              for: indexPath)

            guard let header = headerView as? HeaderCollectionReusableView
            else { return headerView }

            header.configure(with: friendProfile!)
            
            header.avatarImageView.layer.masksToBounds = true
            header.avatarImageView.layer.cornerRadius = 25
            
            return header
            
          default:
            assert(false, "Invalid element type")
          }
    }
    
    // segue for full photo view
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "showPhoto" {
            guard let gallery = segue.destination as? FriendPhotoViewController else { return }
            
            // индекс нажатой ячейки
            if let indexPath = collectionView.indexPathsForSelectedItems?.first {
                gallery.allPhotos = friendProfile!.photos //фотки
                gallery.currentPhotoCounter = indexPath.row // indexPath[0][1] если не использовать ?.first выше
            }
        }
    }
    
    @IBAction func unwindToFriendsSegue(segue: UIStoryboardSegue){
            
        }
    
}
