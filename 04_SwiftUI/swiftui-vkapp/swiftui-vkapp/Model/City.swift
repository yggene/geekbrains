//
//  City.swift
//  swiftui-vkapp
//
//  Created by Evgeny Alekseev on 07.02.2022.
//

import SwiftUI
import RealmSwift

class City: Object, Codable {
    @Persisted(primaryKey: true) var id: Int
    @Persisted var title: String
    
    enum CodingKeys: String, CodingKey {
        case id, title
    }
}
