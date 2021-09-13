//
//  Friend.swift
//  fakeVKapp
//
//  Created by Evgeny Alekseev on 11.09.2021.
//

import UIKit

final class News: Equatable {
    
    static var count: Int = 0
    
    let id: Int
    let authorID: Int
    let postDate: String
    let text: String
    let photo: Photo?
    var likesCount: Int
    var commentsCount: Int
    var sharesCount: Int
    var viewCount: Int
    
    init(
        id: Int,
        authorID: Int,
        postDate: String,
        text: String,
        photo: Photo,
        likesCount: Int = 0,
        commentsCount: Int = 0,
        sharesCount: Int = 0,
        viewCount: Int = 0
    ){
        News.count += 1
        self.id = News.count
        self.authorID = authorID
        self.postDate = postDate
        self.text = text
        self.photo = photo
        self.likesCount = likesCount
        self.commentsCount = commentsCount
        self.sharesCount = sharesCount
        self.viewCount = viewCount
    }
    
    convenience init() {
        self.init(
            id: News.count,
            authorID: randomProfileId(),
            postDate: "Tomorrow",
            text: "Some draft text, long enough to make sure everything fits in a cell",
            photo: Photo(image: randomNewsImage()),
            likesCount: Int.random(in: 0...50),
            commentsCount: Int.random(in: 0...20),
            sharesCount: Int.random(in: 0...10),
            viewCount: Int.random(in: 50...500)
        )
    }
    
    static func == (lhs: News, rhs: News) -> Bool {
        return lhs.id == rhs.id
    }
    
}
