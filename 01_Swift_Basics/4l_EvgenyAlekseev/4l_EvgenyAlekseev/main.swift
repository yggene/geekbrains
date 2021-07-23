//
//  main.swift
//  4l_EvgenyAlekseev
//
//  Created by Evgeny Alekseev on 22.07.2021.
//

var mySportCar: SportCar? = SportCar(
    model: "Ferrari",
    manufactureYear: 2021,
    engineState: .stopped,
    windowsState: .closed,
    spoiler: true,
    nitro: .off)

var myTrunkCar: TrunkCar? = TrunkCar(
    model: "GAZ-51",
    manufactureYear: 1951,
    engineState: .stopped,
    windowsState: .closed,
    maxTrunkVolume: 2000)

mySportCar!.carAction(.nitroOn)
mySportCar!.carAction(.startEngine)
mySportCar!.carAction(.nitroOn)
mySportCar!.carAction(.loadIntoTrunk(400))
print("")
myTrunkCar!.carAction(.stopEngine)
myTrunkCar!.carAction(.startEngine)
myTrunkCar!.carAction(.loadIntoTrunk(900))
myTrunkCar!.carAction(.openWindows)
myTrunkCar!.carAction(.unloadFromTrunk(1200))
myTrunkCar!.carAction(.unloadFromTrunk(750))
print("")
mySportCar!.printInfo()
myTrunkCar!.printInfo()

mySportCar = nil
myTrunkCar = nil
