//
//  City.swift
//  fakeVKapp
//
//  Created by Evgeny Alekseev on 17.10.2021.
//

import Foundation
import RealmSwift

final class City: Object {
    @objc dynamic var id: Int
    @objc dynamic var title: String
    
    override static func primaryKey() -> String? {
        return "id"
    }
}

extension City: Codable {
    enum CodingKeys: String, CodingKey {
        case id, title
    }
}
