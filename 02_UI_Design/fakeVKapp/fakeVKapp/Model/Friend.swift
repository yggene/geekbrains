//
//  Friend.swift
//  fakeVKapp
//
//  Created by Evgeny Alekseev on 24.08.2021.
//

import UIKit

struct Friend {
    
    let firstName: String
    let lastName: String
    let origin: Origin
    let avatar: UIImage?
    var photos: [UIImage?]
    
}

enum Origin: String {
    case earth = "Earth"
    case birdWorld = "Bird World"
}
