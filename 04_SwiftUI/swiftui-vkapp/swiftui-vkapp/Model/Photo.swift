//
//  Photo.swift
//  swiftui-vkapp
//
//  Created by Evgeny Alekseev on 01.02.2022.
//

import SwiftUI

struct UserPhotos: Codable {
    var items: [Photo]
}

class Photo: Codable, Identifiable {
    var id: Int
    var ownerID: Int
    var sizes: [Size]
    var likes: Likes?
    
    var url: URL? {
        guard let image = sizes.first(where: { $0.type == "x"} ) else { return nil }
        return URL(string: image.url)
    }
    
    enum CodingKeys: String, CodingKey {
        case id
        case ownerID = "owner_id"
        case sizes, likes
    }
}

final class Size {
    var type: String = ""
    var url: String = ""
}

extension Size: Codable {
    enum CodingKeys: String, CodingKey {
        case type, url
    }
}

final class Likes {
    var userLikes: Int = 0
    var count: Int = 0
}

extension Likes: Codable {
    enum CodingKeys: String, CodingKey {
        case userLikes = "user_likes"
        case count
    }
}
