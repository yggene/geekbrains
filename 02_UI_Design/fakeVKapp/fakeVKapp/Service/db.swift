//
//  File.swift
//  fakeVKapp
//
//  Created by Evgeny Alekseev on 04.09.2021.
//

import UIKit

var myGroups = [Group]()

var allGroups = [
    Group(name: "Narnia Dimension",
          image: UIImage(named: "group-narnia-dimension")),
    Group(name: "Wasp Universe",
          image: UIImage(named: "group-wasp-universe")),
    Group(name: "Cronenberged Dimension",
          image: UIImage(named: "group-cronenberged-dimension")),
    Group(name: "Dimension C-132",
          image: UIImage(named: "group-dimension-c132")),
    Group(name: "Corn World",
          image: UIImage(named: "group-corn-world")),
    Group(name: "Froopyland",
          image: UIImage(named: "group-froopyland"))
]

var friends = [
    Friend(firstName: "Morty",
           lastName: "Smith",
           origin: .earth,
           avatar: Photo(image: UIImage(named: "morty-avatar"))),
    Friend(firstName: "Beth",
           lastName: "Smith",
           origin: .earth,
           avatar: Photo(image: UIImage(named: "beth-avatar")),
           photos: [Photo(image: UIImage(named: "beth-photo-1")),
                    Photo(image: UIImage(named: "beth-photo-2")),
                    Photo(image: UIImage(named: "beth-photo-3")),
                    Photo(image: UIImage(named: "beth-photo-4"))]),
    Friend(firstName: "Summer",
           lastName: "Smith",
           origin: .earth,
           avatar: Photo(image: UIImage(named: "summer-avatar"))),
    Friend(firstName: "Bird",
           lastName: "Person",
           origin: .birdWorld,
           avatar: Photo(image: UIImage(named: "birdie-avatar"))),
]

var news = [News]()
