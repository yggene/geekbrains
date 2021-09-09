//
//  Group.swift
//  fakeVKapp
//
//  Created by Evgeny Alekseev on 25.08.2021.
//

import UIKit

struct Group: Equatable {
    let name: String
    let image: UIImage?
    
    static func == (lhs: Group, rhs: Group) -> Bool {
        return lhs.name == rhs.name
    }

}
