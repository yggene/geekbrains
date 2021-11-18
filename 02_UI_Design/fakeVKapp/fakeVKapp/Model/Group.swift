//
//  Group.swift
//  fakeVKapp
//
//  Created by Evgeny Alekseev on 25.08.2021.
//

import Foundation
import RealmSwift

struct UserGroups: Codable {
    var items: [Group]
}

struct popularGroups: Codable {
    var items: [Group]
}

final class Group: Object {
    @Persisted(primaryKey: true) var id: Int
    @Persisted var name: String
    @Persisted var photo: String
    
    var photoURL: URL? {
        URL(string: photo)
    }
}

extension Group: Codable {
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case photo = "photo_200"
    }
}
