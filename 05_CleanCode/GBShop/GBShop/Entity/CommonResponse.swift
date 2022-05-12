//
//  CommonResponseResult.swift
//  GBShop
//
//  Created by Evgeny Alekseev on 20.03.2022.
//

import Foundation

struct CommonResponse: Codable {
    let result: Int
    let userMessage: String?
}
