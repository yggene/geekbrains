//
//  Photo.swift
//  fakeVKapp
//
//  Created by Evgeny Alekseev on 09.09.2021.
//

import Foundation
import RealmSwift

struct UserPhotos: Codable {
    var items: [Photo]
}

final class Photo: Object {
    @objc dynamic var id: Int = 0
    @objc dynamic var ownerID: Int = 0
    var sizes = List<Size>()
    var likes: Likes? = nil

    var url: URL? {
            guard let image = sizes.first(where: { $0.type == "x"} ) else { return nil }
            return URL(string: image.url)
        }

    override static func primaryKey() -> String? {
        return "id"
    }
}

extension Photo: Codable {
    enum CodingKeys: String, CodingKey {
        case id
        case ownerID = "owner_id"
        case sizes, likes
    }
}

final class Size: Object {
    @objc dynamic var type: String = ""
    @objc dynamic var url: String = ""
    let owner = LinkingObjects(fromType: Photo.self, property: "sizes")
    
}

extension Size: Codable {
    enum CodingKeys: String, CodingKey {
        case type, url
    }
}

final class Likes: Object {
    @objc dynamic var userLikes: Int = 0
    @objc dynamic var count: Int = 0
}

extension Likes: Codable {
    enum CodingKeys: String, CodingKey {
        case userLikes = "user_likes"
        case count
    }
}
