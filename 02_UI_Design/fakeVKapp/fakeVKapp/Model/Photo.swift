//
//  Photo.swift
//  fakeVKapp
//
//  Created by Evgeny Alekseev on 09.09.2021.
//

import UIKit

final class Photo: Equatable {
    
    static var photoCount = 0
    
    let id: Int
    let image: UIImage?
    var isLiked: Bool
    var likesCount: Int = 0
    
    init(
        image: UIImage?
    ){
        Photo.photoCount += 1
        self.id = Photo.photoCount
        self.image = image
        self.isLiked = false
    }
    
    static func == (lhs: Photo, rhs: Photo) -> Bool {
        return lhs.id == rhs.id
    }
}
