//
//  Catalog.swift
//  GBShop
//
//  Created by Evgeny Alekseev on 11.04.2022.
//

import Foundation

struct CatalogResponse: Codable {
    let pageNumber: Int
    let products: [Product]
}
