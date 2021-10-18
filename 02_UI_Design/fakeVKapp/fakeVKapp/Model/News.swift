//
//  Friend.swift
//  fakeVKapp
//
//  Created by Evgeny Alekseev on 11.09.2021.
//

import UIKit
import SwiftUI

//final class News: Equatable {
//
//    static var count: Int = 0
//
//    let id: Int
//    let authorID: Int
//    let postDate: String
//    let text: String
//    let photo: Photo?
//    var likesCount: Int
//    var commentsCount: Int
//    var sharesCount: Int
//    var viewCount: Int
//
//    init(
//        id: Int,
//        authorID: Int,
//        postDate: String,
//        text: String,
//        photo: Photo,
//        likesCount: Int = 0,
//        commentsCount: Int = 0,
//        sharesCount: Int = 0,
//        viewCount: Int = 0
//    ){
//        News.count += 1
//        self.id = News.count
//        self.authorID = authorID
//        self.postDate = postDate
//        self.text = text
//        self.photo = photo
//        self.likesCount = likesCount
//        self.commentsCount = commentsCount
//        self.sharesCount = sharesCount
//        self.viewCount = viewCount
//    }
//
//    //    convenience init() {
//    //        self.init(
//    //            id: News.count,
//    //            //authorID: randomProfileId(),
//    //            postDate: "Today",
//    //            text: "Some draft text, long enough to make sure everything fits in a cell",
//    //            photo: Photo(image: randomNewsImage()),
//    //            likesCount: Int.random(in: 0...50),
//    //            commentsCount: Int.random(in: 0...20),
//    //            sharesCount: Int.random(in: 0...10),
//    //            viewCount: Int.random(in: 50...500)
//    //        )
//    //    }
//
//    static func == (lhs: News, rhs: News) -> Bool {
//        return lhs.id == rhs.id
//    }
//
//}

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
