//
//  main.swift
//  5l_EvgenyAlekseev
//
//  Created by Evgeny Alekseev on 24.07.2021.
//

var myNewSportCar = SportCar(model: "Ferrari",
                             manufactureYear: 2021,
                             spoiler: true)
var myNewTrunkCar = TrunkCar(model: "GAZ-51",
                             manufactureYear: 1951,
                             maxTrunkVolume: 2000)

print(myNewSportCar)
myNewSportCar.engineAction(.start)
myNewSportCar.windowsAction(.open)
myNewSportCar.nitroAction(.turnOn)
print(myNewSportCar)

print(myNewTrunkCar)
myNewTrunkCar.trunkAction(.loadIntoTrunk(2100))
myNewTrunkCar.trunkAction(.loadIntoTrunk(1800))
myNewTrunkCar.trunkAction(.unloadFromTrunk(1801))
myNewTrunkCar.trunkAction(.unloadFromTrunk(500))
myNewTrunkCar.engineAction(.start)
myNewTrunkCar.windowsAction(.open)
print(myNewTrunkCar)
