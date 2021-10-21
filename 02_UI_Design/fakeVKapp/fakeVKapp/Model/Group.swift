//
//  Group.swift
//  fakeVKapp
//
//  Created by Evgeny Alekseev on 25.08.2021.
//

import Foundation
import RealmSwift

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

struct UserGroups: Codable {
    var items: [Group]
}

struct popularGroups: Codable {
    var items: [Group]
}

final class Group: Object {
    @Persisted(primaryKey: true) var id: Int
    @Persisted var name: String
    @Persisted var photo: String
    
    var photoURL: URL? {
        URL(string: photo)
    }
}

extension Group: Codable {
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case photo = "photo_200"
    }
}
