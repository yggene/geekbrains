//
//  Friend.swift
//  swiftui-vkapp
//
//  Created by Evgeny Alekseev on 31.01.2022.
//

import SwiftUI

struct Users: Codable {
    var items: [User]
}

struct User: Codable, Identifiable {
    var id: Int
    var firstName: String
    var lastName: String
    var avatar: String
    var city: City?
    
    var avatarURL: URL? {
        URL(string: avatar)
    }
    
    enum CodingKeys: String, CodingKey {
        case id
        case firstName = "first_name"
        case lastName = "last_name"
        case avatar = "photo_100"
        case city
    }
}
