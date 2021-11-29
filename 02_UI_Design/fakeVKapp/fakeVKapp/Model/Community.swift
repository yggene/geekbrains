//
//  Group.swift
//  fakeVKapp
//
//  Created by Evgeny Alekseev on 25.08.2021.
//

import Foundation
import RealmSwift

struct UserGroups: Codable {
    var items: [Community]
}

struct popularGroups: Codable {
    var items: [Community]
}

final class Community: Object {
    @Persisted(primaryKey: true) var id: Int
    @Persisted var name: String
    @Persisted var photo: String
    
    var photoURL: URL? {
        URL(string: photo)
    }
}

extension Community: Codable {
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case photo = "photo_200"
    }
}
