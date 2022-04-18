//
//  ProductResponse.swift
//  GBShop
//
//  Created by Evgeny Alekseev on 11.04.2022.
//

import Foundation

struct ProductResponse: Codable {
    let result: Int
    let product: Product?
}
