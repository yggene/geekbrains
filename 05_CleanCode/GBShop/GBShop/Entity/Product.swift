//
//  Product.swift
//  GBShop
//
//  Created by Evgeny Alekseev on 11.04.2022.
//

import Foundation

struct Product: Codable {
    let result: Int?
    let productID: Int?
    let productName: String
    let productPrice: Double
    let productDescription: String?
    
    enum CodingKeys: String, CodingKey {
        case result
        case productID = "id_product"
        case productName = "product_name"
        case productPrice = "product_price"
        case productDescription = "product_description"
    }
}
