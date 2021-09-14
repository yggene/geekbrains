//
//  Friend.swift
//  fakeVKapp
//
//  Created by Evgeny Alekseev on 24.08.2021.
//

import UIKit

final class Friend: Equatable {
    
    static var userCount = 0
    
    let id: Int
    let firstName: String
    let lastName: String
    let origin: Origin
    let avatar: Photo
    var photos: [Photo?]
    
    init(
        firstName: String,
        lastName: String,
        origin: Origin,
        avatar: Photo,
        photos: [Photo?] = []
    ){
        Friend.userCount += 1
        self.id = Friend.userCount
        self.firstName = firstName
        self.lastName = lastName
        self.origin = origin
        self.avatar = avatar
        self.photos = photos
    }
    
    convenience init() {
        self.init(
            firstName: randomFirstName(),
            lastName: randomLastName(),
            origin: Origin.random(),
            avatar: Photo(image: randomAvatar()),
            photos: []
        )
    }
    
    static func == (lhs: Friend, rhs: Friend) -> Bool {
        return lhs.id == rhs.id
    }
    
    func getInfo() {
        print("""
            ID: \(id)
            Name: \(firstName) \(lastName)
            Origin: \(origin.rawValue)
            Avatar: \(String(describing: avatar))
            """)
    }
}
