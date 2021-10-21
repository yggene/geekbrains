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

class Photo: Object, Codable {
    @Persisted var id: Int = 0
    @Persisted var ownerID: Int = 0
    @Persisted var sizes = List<Size>()
    @Persisted var likes: Likes? = nil
    
    var url: URL? {
        guard let image = sizes.first(where: { $0.type == "x"} ) else { return nil }
        return URL(string: image.url)
    }
    
    override static func primaryKey() -> String? {
        "id"
    }
    
    enum CodingKeys: String, CodingKey {
        case id
        case ownerID = "owner_id"
        case sizes, likes
    }
}

final class Size: Object {
    @Persisted var type: String = ""
    @Persisted var url: String = ""
    let owner = LinkingObjects(fromType: Photo.self, property: "sizes")
    
}

extension Size: Codable {
    enum CodingKeys: String, CodingKey {
        case type, url
    }
}

final class Likes: Object {
    @Persisted var userLikes: Int = 0
    @Persisted var count: Int = 0
    let owner = LinkingObjects(fromType: Photo.self, property: "likes")
}

extension Likes: Codable {
    enum CodingKeys: String, CodingKey {
        case userLikes = "user_likes"
        case count
    }
}
