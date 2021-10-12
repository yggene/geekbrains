//
//  Friend.swift
//  fakeVKapp
//
//  Created by Evgeny Alekseev on 24.08.2021.
//

import Foundation

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

struct Friends: Decodable {
    var items: [Friend]
}

struct Friend {
    var id: Int
    var firstName: String
    var lastName: String
    var avatar: String
    var avatarURL: URL? {
        URL(string: avatar)
    }
    var city: City?
}

struct City: Decodable {
    var id: Int
    var title: String
}

extension Friend: Decodable {
    enum CodingKeys: String, CodingKey {
        case id
        case firstName = "first_name"
        case lastName = "last_name"
        case avatar = "photo_200_orig"
        case city
    }
    
    enum CityKeys: String, CodingKey {
        case id, title
    }
    
    init(from decoder: Decoder) throws {
        let responseContainer = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try responseContainer.decode(Int.self, forKey: .id)
        self.firstName = try responseContainer.decode(String.self, forKey: .firstName)
        self.lastName = try responseContainer.decode(String.self, forKey: .lastName)
        self.avatar = try responseContainer.decode(String.self, forKey: .avatar)
        self.city = try responseContainer.decodeIfPresent(City.self, forKey: .city)
    }
        
}
