//
//  FriendPhotoCollectionViewController.swift
//  fakeVKapp
//
//  Created by Evgeny Alekseev on 26.08.2021.
//

import UIKit
import Nuke
import RealmSwift

class FriendPhotoCollectionViewController: UICollectionViewController,
                                           UICollectionViewDelegateFlowLayout {
    
    // MARK: Variables
    
    var friendProfile: Friend?
    var userPhotos = [Photo]()
    @IBAction func friendLikeButton(_ sender: Any) {
    }
    
    var networkService = NetworkService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fetchFriendsPhotos()
//        loadPhotosFromRealm(with: friendProfile!.id)

    }
    
    // MARK: Methods
    
    private func loadPhotosFromRealm(with userID: Int) {
        do {
            let photosFromRealm = try RealmService.load(typeOf: Photo.self).filter("ownerID == %@", userID)
            self.userPhotos = Array(photosFromRealm)
        } catch {
            print(error)
        }
    }
    
    private func fetchFriendsPhotos() {
        
        networkService.getPhotos(ofUser: friendProfile!.id) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success/*(let userPhotos)*/:
                self.loadPhotosFromRealm(with: self.friendProfile!.id)
//                self.userPhotos = userPhotos
                self.collectionView.reloadData()
            case .failure(let requestError):
                switch requestError {
                case .invalidUrl:
                    print("Error: Invalid URL detected")
                case .errorDecode:
                    print("Error: Decode problem. Check the JSON data")
                case .failedRequest:
                    print("Error: Request failed")
                case .unknownError:
                    print("Error: Unknown")
                case .realmSaveFailure:
                    print("Error: Could not save to Realm")
                }
            }
        }
    }
    
    // MARK: UICollectionViewDataSource
    
    override func collectionView(_ collectionView: UICollectionView,
                                 numberOfItemsInSection section: Int) -> Int {
        userPhotos.count
    }
    
    // cell config
    override func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: "friendPhotoCollectionViewCell",
                for: indexPath) as? FriendPhotoCollectionViewCell else {
                    return UICollectionViewCell() }
            
            let photo = userPhotos[indexPath.item]
            Nuke.loadImage(with: photo.url, into: cell.photoImageView)
            
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
            
            if let indexPath = collectionView.indexPathsForSelectedItems?.first {
                gallery.allPhotos = userPhotos
                gallery.currentPhotoCounter = indexPath.row
            }
        }
    }
    
    @IBAction func unwindToFriendsSegue(segue: UIStoryboardSegue){
        
    }
    
}
