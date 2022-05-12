//
//  Product.swift
//  GBShop
//
//  Created by Evgeny Alekseev on 18.04.2022.
//

import Foundation

struct Product: Codable {
    let productID: Int
    let productName: String
    let productPrice: Double
    let productDescription: String
}
