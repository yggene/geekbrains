//
//  Photo.swift
//  swiftui-vkapp
//
//  Created by Evgeny Alekseev on 01.02.2022.
//

import SwiftUI
import RealmSwift

struct UserPhotos: Codable {
    var items: [Photo]
}

class Photo: Object, Codable {
    @Persisted var id: Int = 0
    @Persisted var ownerID: Int = 0
    var sizes: [Size] = []
    var likes: Likes? = nil
    
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
    var type: String = ""
    var url: String = ""
    let owner = LinkingObjects(fromType: Photo.self, property: "sizes")
    
}

extension Size: Codable {
    enum CodingKeys: String, CodingKey {
        case type, url
    }
}

final class Likes: Object {
    var userLikes: Int = 0
    var count: Int = 0
    let owner = LinkingObjects(fromType: Photo.self, property: "likes")
}

extension Likes: Codable {
    enum CodingKeys: String, CodingKey {
        case userLikes = "user_likes"
        case count
    }
}
