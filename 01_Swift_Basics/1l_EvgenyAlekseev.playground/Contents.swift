//
//  main.swift
//  L1_EvgenyAlekseev
//
//  Created by Evgeny Alekseev on 10.07.2021.
//

import Foundation

// Part 1. Solving quadratic equations
print("Part 1. Solving quadratic equations\n")

let a = 5.0
let b = 10.0
let c = 10.0
let d: Double = pow(b, 2) - (4 * a * c)

print("a = \(a), b = \(b), c = \(c)")

if a == 0 && b == 0 && c == 0 {
    print("Any root possible")
} else if (a == 0 && c == 0) || (b == 0 && c == 0) {
    print("x = 0")
} else if a == 0 && b == 0 {
    print("No roots found")
} else if a == 0 {
    print("x = \(-c / b)")
} else if d < 0 {
    print("D = \(d)")
    print("""
          x1 = \(-b / (2 * a)) + \(sqrt(-d) / (2 * a))i
          x2 = \(-b / (2 * a)) - \(sqrt(-d) / (2 * a))i
          """)
} else if d == 0 {
    print("D = \(d)")
    print("x = \(-b / (2 * a))")
} else {
    print("D = \(d)")
    print("x1 = \((-b + sqrt(d)) / (2 * a)); x2 = \((-b - sqrt(d)) / (2 * a))")
}
print("\n******************\n")

// Part 2. Calculate area, perimeter, and hypotenuse of a right triangle by its catheti
print("Part 2. Calculate area, perimeter, and hypotenuse of a right triangle by its catheti\n")

let cathetus1 = 6.0
let cathetus2 = 8.0
let area = cathetus1 * cathetus2 / 2
let hypotenuse = sqrt(pow(cathetus1, 2) + pow(cathetus2, 2))
let perimeter = cathetus1 + cathetus2 + hypotenuse

print("Cathetus 1 = \(cathetus1), cathetus 2 = \(cathetus2)")

if cathetus1 == 0 || cathetus2 == 0 {
    print("This is not a triangle")
} else {
    print("""
    Hypotenuse: \(hypotenuse)
    Area: \(area)
    Perimeter: \(perimeter)
    """)
}

print("\n******************\n")

// Part 3. Calculate deposit amount after 5 years multiplied by annual interest
print("Part 3. Calculate deposit amount after 5 years multiplied by annual interest\n")

let depo: Decimal = 1000
let interest = 10
let years = 5
var result: Decimal = depo

print("Initial deposit: \(depo)")
print("Interest rate: \(interest)")

for _ in 1...years {
    result += result * Decimal(interest) / 100
}

print("Deposit amount after \(years) years at \(interest)% interest: \(result)\n")
