//
//  News.swift
//  swiftui-vkapp
//
//  Created by Evgeny Alekseev on 01.02.2022.
//

import SwiftUI

struct Newsfeed: Codable {
    var items: [NewsItem]
    var profiles: [User]
    var communities: [Community]
    
    enum CodingKeys: String, CodingKey {
        case items
        case profiles
        case communities
    }
}

// MARK: News
final class NewsItem {
    var sourceId: Int
    var date: Double
    var text: String
    var attachments: [Attachment]?
    var comments: Comments?
    var likes: Likes?
    var views: Views?
    var reposts: Reposts?
    var markedAsAds: Int?
    
    var attachmentPhotoUrl: URL? {
        guard
            let image = attachments?.first(where: { $0.type == "photo"} ),
            let size = image.photo?.sizes.first(where: { $0.type == "x"} )
        else { return nil }
        return URL(string: size.url)
    }
}

extension NewsItem: Codable {
    enum CodingKeys: String, CodingKey {
        case sourceId = "source_id"
        case date
        case text
        case attachments
        case comments
        case likes
        case views
        case reposts
        case markedAsAds
    }
}

// MARK: Attachments
final class Attachment {
    var type: String
    var photo: Photo?
}

extension Attachment: Codable {
    enum CodingKeys: String, CodingKey {
        case type
        case photo
    }
}

// MARK: Comments
final class Comments {
    var count: Int
}

extension Comments: Codable {
    enum CodingKeys: String, CodingKey {
        case count
    }
}

// MARK: Views
final class Views {
    var count: Int
}

extension Views: Codable {
    enum CodingKeys: String, CodingKey {
        case count
    }
}

// MARK: Reposts
final class Reposts {
    var count: Int
}

extension Reposts: Codable {
    enum CodingKeys: String, CodingKey {
        case count
    }
}
