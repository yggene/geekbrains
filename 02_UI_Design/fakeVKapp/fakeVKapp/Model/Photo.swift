//
//  Photo.swift
//  fakeVKapp
//
//  Created by Evgeny Alekseev on 09.09.2021.
//

import Foundation
import RealmSwift

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

struct UserPhotos: Codable {
    var items: [Photo]
}

final class Photo: Object {
    @objc dynamic var id: Int
    @objc dynamic var ownerID: Int
    var sizes: [Size]
    @objc dynamic var likes: Likes?
    
    override static func primaryKey() -> String? {
        return "id"
    }
    
}

final class Size: Object {
    @objc dynamic var url: String
    @objc dynamic var type: String
}

final class Likes: Object {
    @objc dynamic var userLikes: Int
    @objc dynamic var count: Int
}

extension Photo: Codable {
    enum CodingKeys: String, CodingKey {
        case id
        case ownerID = "owner_id"
        case sizes
        case likes
    }
    
    // MARK: SECURE OTHER TYPES!
    var url: URL? {
        guard let image = sizes.first(where: { $0.type == "x"} ) else {return nil}
        return URL(string: image.url)
    }
}

extension Size: Codable {
    enum CodingKeys: String, CodingKey {
        case url, type
    }
}

extension Likes: Codable {
    enum CodingKeys: String, CodingKey {
        case userLikes = "user_likes"
        case count
    }
}
