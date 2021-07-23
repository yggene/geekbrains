//
//  SportsCar.swift
//  4l_EvgenyAlekseev
//
//  Created by Evgeny Alekseev on 22.07.2021.
//

class SportCar: Car {
    // Constants
    let carType = "Sport car"
    let spoiler: Bool
    
    // Variables
    private(set) var nitroState: NitroState {
        didSet {
            print(nitroState.rawValue)
        }
    }
    
    // Methods
    init(
        model: String,
        manufactureYear: Int,
        engineState: EngineState,
        windowsState: WindowsState,
        spoiler: Bool,
        nitro: NitroState) {
        self.spoiler = spoiler
        self.nitroState = nitro
        super.init(model: model,
                   manufactureYear: manufactureYear,
                   engineState: engineState,
                   windowsState: windowsState)
    }
    
    override func carAction(_ action: CarActions) {
        switch action {
        case .nitroOn:
            if engineState == .stopped {
                print("Start the engine first.")
            } else if nitroState == .on {
                print("Nitro is on already.")
            } else {
                nitroState = .on
            }
        case .nitroOff:
            if nitroState == .off {
                print("Nitro is off already.")
            } else {
                nitroState = .off
            }
        default:
            super.carAction(action)
        }
    }
    
    override func printInfo() {
        print("*** My \(carType) info ***")
        super.printInfo()
        print("Nitro state: \(nitroState)")
        spoiler ? print("Spoiler: available\n") : print("Spoiler: none\n")
    }
}
