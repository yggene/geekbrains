//
//  Group.swift
//  fakeVKapp
//
//  Created by Evgeny Alekseev on 25.08.2021.
//

import UIKit

final class Group: Equatable {
    
    static var groupsCount = 0
    
    let id: Int
    let name: String
    let image: UIImage?
    
    init(
        name: String,
        image: UIImage?
    ){
        Group.groupsCount += 1
        self.id = Group.groupsCount
        self.name = name
        self.image = image
    }
    
    static func == (lhs: Group, rhs: Group) -> Bool {
        return lhs.id == rhs.id
    }
    
    func getInfo() {
        print("""
            ID: \(id)
            Name: \(name)
            Image: \(String(describing: image))
            """)
    }
    
}
