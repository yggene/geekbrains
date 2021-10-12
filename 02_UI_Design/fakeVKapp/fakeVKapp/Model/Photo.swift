//
//  Photo.swift
//  fakeVKapp
//
//  Created by Evgeny Alekseev on 09.09.2021.
//

import UIKit

//final class Photo: Equatable {
//
//    static var photoCount = 0
//
//    let id: Int
//    let image: UIImage?
//    var isLiked: Bool
//    var likesCount: Int = 0
//
//    init(
//        image: UIImage?
//    ){
//        Photo.photoCount += 1
//        self.id = Photo.photoCount
//        self.image = image
//        self.isLiked = false
//    }
//
//    static func == (lhs: Photo, rhs: Photo) -> Bool {
//        return lhs.id == rhs.id
//    }
//}

struct userPhotos: Decodable {
    var items: [Photo]
}

final class Photo {
    var id: Int
    var ownerID: Int
    var photo: String
    var photoURL: URL? {
        URL(string: photo)
    }
    var sizes: Sizes?
    
    init(from decoder: Decoder) throws {
        let responseContainer = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try responseContainer.decode(Int.self, forKey: .id)
        self.ownerID = try responseContainer.decode(Int.self, forKey: .ownerID)
        self.photo = try responseContainer.decode(String.self, forKey: .photo)
        self.sizes = try responseContainer.decodeIfPresent(Sizes.self, forKey: .sizes)
    }
}

final class Sizes: Decodable {
    var url: String
    var type: String
}

extension Photo: Decodable {
    enum CodingKeys: String, CodingKey {
        case id
        case ownerID = "owner_id"
        case photo
        case sizes
    }
}
