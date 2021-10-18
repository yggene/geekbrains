//
//  Friend.swift
//  fakeVKapp
//
//  Created by Evgeny Alekseev on 24.08.2021.
//

import Foundation
import RealmSwift

//final class Friend: Equatable {
//
//    static var userCount = 0
//
//    let id: Int
//    let firstName: String
//    let lastName: String
//    let origin: Origin
//    let avatar: Photo
//    var photos: [Photo?]
//
//    init(
//        firstName: String,
//        lastName: String,
//        origin: Origin,
//        avatar: Photo,
//        photos: [Photo?] = []
//    ){
//        Friend.userCount += 1
//        self.id = Friend.userCount
//        self.firstName = firstName
//        self.lastName = lastName
//        self.origin = origin
//        self.avatar = avatar
//        self.photos = photos
//    }
//
//    convenience init() {
//        self.init(
//            firstName: randomFirstName(),
//            lastName: randomLastName(),
//            origin: Origin.random(),
//            avatar: Photo(image: randomAvatar()),
//            photos: [Photo(image: randomNewsImage()),
//                     Photo(image: randomNewsImage()),
//                     Photo(image: randomNewsImage()),
//                     Photo(image: randomNewsImage()),
//                     Photo(image: randomNewsImage()),
//                     Photo(image: randomNewsImage()),
//                     Photo(image: randomNewsImage()),
//                     Photo(image: randomNewsImage()),
//                     Photo(image: randomNewsImage())]
//        )
//    }
//
//    static func == (lhs: Friend, rhs: Friend) -> Bool {
//        return lhs.id == rhs.id
//    }
//
//    func getInfo() {
//        print("""
//            ID: \(id)
//            Name: \(firstName) \(lastName)
//            Origin: \(origin.rawValue)
//            Avatar: \(String(describing: avatar))
//            """)
//    }
//}

struct Friends: Codable {
    var items: [Friend]
}

class Friend: Object, Codable {
    @objc dynamic var id: Int = 0
    @objc dynamic var firstName: String = ""
    @objc dynamic var lastName: String = ""
    @objc dynamic var avatar: String = ""
    @objc dynamic var city: City? = nil
    
    var avatarURL: URL? {
        URL(string: avatar)
    }
    
    override static func primaryKey() -> String? {
        "id"
    }
    
    override static func indexedProperties() -> [String] {
        ["firstName", "lastName"]
    }
    
    enum CodingKeys: String, CodingKey {
        case id
        case firstName = "first_name"
        case lastName = "last_name"
        case avatar = "photo_200_orig"
        case city
    }
}
