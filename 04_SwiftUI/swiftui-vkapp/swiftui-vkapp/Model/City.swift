//
//  City.swift
//  swiftui-vkapp
//
//  Created by Evgeny Alekseev on 07.02.2022.
//

import Foundation

class City: Codable, Identifiable {
    var id: Int
    var title: String
    
    enum CodingKeys: String, CodingKey {
        case id, title
    }
}
