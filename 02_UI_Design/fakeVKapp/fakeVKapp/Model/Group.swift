//
//  Group.swift
//  fakeVKapp
//
//  Created by Evgeny Alekseev on 25.08.2021.
//

import UIKit

//final class Group: Equatable {
//
//    static var groupsCount = 0
//
//    let id: Int
//    let name: String
//    let image: UIImage?
//
//    init(
//        name: String,
//        image: UIImage?
//    ){
//        Group.groupsCount += 1
//        self.id = Group.groupsCount
//        self.name = name
//        self.image = image
//    }
//
//    static func == (lhs: Group, rhs: Group) -> Bool {
//        return lhs.id == rhs.id
//    }
//
//    func getInfo() {
//        print("""
//            ID: \(id)
//            Name: \(name)
//            Image: \(String(describing: image))
//            """)
//    }
//
//}

struct UserGroups: Decodable {
    var items: [Group]
}

struct popularGroups: Decodable {
    var items: [Group]
}

final class Group {
    var id: Int
    var name: String
    var photo: String
    var photoURL: URL? {
        URL(string: photo)
    }
    
    init(from decoder: Decoder) throws {
        let responseContainer = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try responseContainer.decode(Int.self, forKey: .id)
        self.name = try responseContainer.decode(String.self, forKey: .name)
        self.photo = try responseContainer.decode(String.self, forKey: .photo)
    }
}

extension Group: Decodable {
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case photo = "photo_200"
    }
}
