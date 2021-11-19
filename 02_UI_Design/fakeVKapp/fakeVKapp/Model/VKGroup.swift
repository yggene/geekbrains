//
//  Group.swift
//  fakeVKapp
//
//  Created by Evgeny Alekseev on 25.08.2021.
//

import Foundation
import RealmSwift

struct UserGroups: Codable {
    var items: [VKGroup]
}

struct popularGroups: Codable {
    var items: [VKGroup]
}

class VKGroup: Object, Codable {
    @Persisted(primaryKey: true) var id: Int = 0
    @Persisted var name: String = ""
    @Persisted var photo: String = ""
    
    var photoURL: URL? {
        URL(string: photo)
    }
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case photo = "photo_200"
    }
}
