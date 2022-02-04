//
//  Friends.swift
//  swiftui-vkapp
//
//  Created by Evgeny Alekseev on 01.02.2022.
//

import Foundation

var friends: [User] = [
    User(name: "Rick Sanches",
           origin: "Dimension C-137",
           avatar: "rick",
           photos: [Photo(name: "rick")]),
    User(name: "Morty Smith",
           origin: "Dimension C-137",
           avatar: "morty",
           photos: [Photo(name: "morty-photo-1"),
                    Photo(name: "morty-photo-2"),
                    Photo(name: "morty-photo-3")]),
    User(name: "Beth Smith",
           origin: "Dimension C-137",
           avatar: "beth",
           photos: [Photo(name: "beth-photo-1"),
                    Photo(name: "beth-photo-2"),
                    Photo(name: "beth-photo-3"),
                    Photo(name: "beth-photo-4")]),
    User(name: "Summer Smith",
           origin: "Dimension C-137",
           avatar: "summer",
           photos: [Photo(name: "summer-photo-1"),
                    Photo(name: "summer-photo-2")]),
    User(name: "Birdperson",
           origin: "Bird World",
           avatar: "birdie",
           photos: [Photo(name: "bird-photo-1"),
                    Photo(name: "bird-photo-2"),
                    Photo(name: "bird-photo-3")])
]