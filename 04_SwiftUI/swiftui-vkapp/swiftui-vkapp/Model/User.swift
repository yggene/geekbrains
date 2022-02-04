//
//  Friend.swift
//  swiftui-vkapp
//
//  Created by Evgeny Alekseev on 31.01.2022.
//

import SwiftUI

final class User: Identifiable {
    private(set) var name: String
    private(set) var origin: String
    private(set) var avatar: String
    private(set) var photos: [Photo]
    private(set) var id: UUID = UUID()
    
    init(name: String,
         origin: String,
         avatar: String,
         photos: [Photo]
    ){
        self.name = name
        self.origin = origin
        self.avatar = avatar
        self.photos = photos
    }
}

extension User: Equatable, Hashable {
    static func == (lhs: User, rhs: User) -> Bool {
        lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
}
