//
//  Friend.swift
//  fakeVKapp
//
//  Created by Evgeny Alekseev on 24.08.2021.
//

import UIKit

struct Friend {
    let firstName: String
    let secondName: String
    let origin: Origin
    let avatar: UIImage?
}

enum Origin: String {
    case earth = "Earth"
    case birdWorld = "Bird World"
}
