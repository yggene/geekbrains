//
//  Community.swift
//  swiftui-vkapp
//
//  Created by Evgeny Alekseev on 01.02.2022.
//

import SwiftUI

struct Community: Identifiable {
    private(set) var name: String
    private(set) var description: String
    private(set) var image: String
    private(set) var id: UUID = UUID()
    
    init(name: String,
         description: String,
         image: String
    ){
        self.name = name
        self.description = description
        self.image = image
    }
}
