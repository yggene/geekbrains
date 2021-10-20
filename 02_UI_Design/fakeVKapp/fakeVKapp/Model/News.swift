//
//  Friend.swift
//  fakeVKapp
//
//  Created by Evgeny Alekseev on 11.09.2021.
//

import UIKit
import SwiftUI

struct Newsfeed: Codable {
    var items: [News]
}

// MARK: News
final class News {
    var date: Double
    var text: String
    var attachments: [Attachment]?
    var comments: Comments
    var likes: Likes
    var views: Views?
    var reposts: Reposts
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
        case date
        case text
        case comments
        case likes
        case attachments
        case views
        case reposts
        case markedAsAds = "marked_as_ads"
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
