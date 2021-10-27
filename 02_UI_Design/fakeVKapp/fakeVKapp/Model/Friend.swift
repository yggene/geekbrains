//
//  Friend.swift
//  fakeVKapp
//
//  Created by Evgeny Alekseev on 24.08.2021.
//

import Foundation
import RealmSwift

struct Friends: Codable {
    var items: [Friend]
}

class Friend: Object, Codable {
    @Persisted(primaryKey: true) var id: Int = 0
    @Persisted(indexed: true) var firstName: String = ""
    @Persisted(indexed: true) var lastName: String = ""
    @Persisted var avatar: String = ""
    @Persisted var city: City? = nil
    
    var avatarURL: URL? {
        URL(string: avatar)
    }
    
    enum CodingKeys: String, CodingKey {
        case id
        case firstName = "first_name"
        case lastName = "last_name"
        case avatar = "photo_200_orig"
        case city
    }
}
