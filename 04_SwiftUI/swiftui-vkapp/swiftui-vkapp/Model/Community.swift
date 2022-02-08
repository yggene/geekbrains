//
//  Community.swift
//  swiftui-vkapp
//
//  Created by Evgeny Alekseev on 01.02.2022.
//

import SwiftUI

struct UserGroups: Codable {
    var items: [Community]
}

struct popularGroups: Codable {
    var items: [Community]
}

struct Community: Identifiable {
    var id: Int
    var name: String
    var photo: String
    var description: String
    
    var photoURL: URL? {
        URL(string: photo)
    }
}

extension Community: Codable {
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case photo = "photo_200"
        case description
    }
}
