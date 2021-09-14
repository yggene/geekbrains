//
//  OriginEnum.swift
//  fakeVKapp
//
//  Created by Evgeny Alekseev on 10.09.2021.
//

enum Origin: String, CaseIterable {
    case earth = "Earth"
    case birdWorld = "Bird World"
    case centralFiniteCurve = "Central Finite Curve"
    case alphabetrium = "Alphabetrium"
    case miniverse = "Miniverse"
    case boobWorld = "Boob World"
    case phoneUniverse = "Phone Universe"
    case pizzaUniverse = "Pizza Universe"
    
    static func random() -> Origin {
        return allCases.randomElement()!
    }
}

