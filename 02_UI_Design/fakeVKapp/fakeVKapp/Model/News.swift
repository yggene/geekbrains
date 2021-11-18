//
//  News.swift
//  fakeVKapp
//
//  Created by Evgeny Alekseev on 11.09.2021.
//

import UIKit

struct Newsfeed: Codable {
    var items: [News]
}

// MARK: News
final class News {
    var sourceId: Int
    var date: Double
    var text: String
    var attachments: [Attachments]?
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

extension News: Codable {
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
final class Attachments {
    var type: String
    var photo: Photo?
}

extension Attachments: Codable {
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
