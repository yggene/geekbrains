//
//  Photo.swift
//  swiftui-vkapp
//
//  Created by Evgeny Alekseev on 01.02.2022.
//

import SwiftUI

struct News: Identifiable {
    var author: String
    var date: String
    var avatar: String
    var newsText: String
    var newsImage: String
    var id: UUID = UUID()
    
    init(author: String,
         date: String,
         avatar: String,
         newsText: String,
         newsImage: String
    ){
        self.author = author
        self.date = date
        self.avatar = avatar
        self.newsText = newsText
        self.newsImage = newsImage
    }
}

extension News: Equatable, Hashable {
    static func == (lhs: News, rhs: News) -> Bool {
        lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
}
