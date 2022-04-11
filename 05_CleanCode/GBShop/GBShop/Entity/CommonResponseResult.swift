//
//  ResponseResult.swift
//  GBShop
//
//  Created by Evgeny Alekseev on 20.03.2022.
//

import Foundation

struct CommonResponseResult: Codable {
    let result: Int?
    let user: User?
    let userMessage: String?
    let errorMessage: String?
}
