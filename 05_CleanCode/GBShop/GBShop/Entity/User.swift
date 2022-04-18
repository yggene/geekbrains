//
//  User.swift
//  GBShop
//
//  Created by Evgeny Alekseev on 18.04.2022.
//

import Foundation

struct User: Codable {
    let userID: Int
    let username: String
    let password: String
    let email: String
    let gender: String
    let creditCard: String
    let bio: String
}
