//
//  City.swift
//  fakeVKapp
//
//  Created by Evgeny Alekseev on 17.10.2021.
//

import Foundation
import RealmSwift

class City: Object, Codable {
    @Persisted(primaryKey: true) var id: Int
    @Persisted var title: String
    
    enum CodingKeys: String, CodingKey {
        case id, title
    }
}
