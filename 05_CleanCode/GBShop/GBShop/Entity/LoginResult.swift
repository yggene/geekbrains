//
//  LoginResult.swift
//  GBShop
//
//  Created by Evgeny Alekseev on 20.03.2022.
//

import Foundation

struct LoginResult: Codable {
    let result: Int
    let user: User
}
