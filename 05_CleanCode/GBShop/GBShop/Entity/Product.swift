//
//  Product.swift
//  GBShop
//
//  Created by Evgeny Alekseev on 11.04.2022.
//

import Foundation

struct Product: Codable {
    let result: Int
    let productName: String?
    let productPrice: Double?
    let productDescription: String?
    let errorMessage: String?
    
    enum CodingKeys: String, CodingKey {
        case result
        case productName = "product_name"
        case productPrice = "product_price"
        case productDescription = "product_description"
        case errorMessage
    }
}
