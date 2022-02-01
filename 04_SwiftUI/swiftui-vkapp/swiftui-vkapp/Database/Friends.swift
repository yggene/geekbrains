//
//  Friends.swift
//  swiftui-vkapp
//
//  Created by Evgeny Alekseev on 01.02.2022.
//

import Foundation

var friends: [Friend] = [
    Friend(name: "Rick Sanches",
           origin: "Dimension C-137",
           avatar: "rick",
           photos: [Photo(name: "rick")]),
    Friend(name: "Morty Smith",
           origin: "Dimension C-137",
           avatar: "morty",
           photos: [Photo(name: "morty-photo-1"),
                    Photo(name: "morty-photo-2"),
                    Photo(name: "morty-photo-3")]),
    Friend(name: "Beth Smith",
           origin: "Dimension C-137",
           avatar: "beth",
           photos: [Photo(name: "beth-photo-1"),
                    Photo(name: "beth-photo-2"),
                    Photo(name: "beth-photo-3"),
                    Photo(name: "beth-photo-4")]),
    Friend(name: "Summer Smith",
           origin: "Dimension C-137",
           avatar: "summer",
           photos: [Photo(name: "summer-photo-1"),
                    Photo(name: "summer-photo-2")]),
    Friend(name: "Birdperson",
           origin: "Bird World",
           avatar: "birdie",
           photos: [Photo(name: "bird-photo-1"),
                    Photo(name: "bird-photo-2"),
                    Photo(name: "bird-photo-3")])
]
