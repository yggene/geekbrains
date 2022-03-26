//
//  LoginResult.swift
//  GBShop
//
//  Created by Evgeny Alekseev on 20.03.2022.
//

import Foundation

struct ResponseResult: Codable {
    let result: Int
    let user: User?
    let authToken: String?
    let userMessage: String?
}
