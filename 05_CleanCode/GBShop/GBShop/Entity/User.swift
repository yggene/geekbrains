//
//  User.swift
//  GBShop
//
//  Created by Evgeny Alekseev on 20.03.2022.
//

import Foundation

struct User: Codable {
    let result: Int?
    let id: Int
    let login: String
    let name: String
    let lastname: String
    
    enum CodingKeys: String, CodingKey {
        case result
        case id = "id_user"
        case login = "user_login"
        case name = "user_name"
        case lastname = "user_lastname"
    }
}
