//
//  Photo.swift
//  swiftui-vkapp
//
//  Created by Evgeny Alekseev on 01.02.2022.
//

import SwiftUI

struct Photo: Identifiable {
    private(set) var name: String
    private(set) var id: UUID = UUID()
    
    init(name: String) {
        self.name = name
    }
}
