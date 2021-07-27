//
//  SportCar.swift
//  5l_EvgenyAlekseev
//
//  Created by Evgeny Alekseev on 25.07.2021.
//

class SportCar: CarProtocol {
    
    // Car protocol props
    let model: String
    let manufactureYear: Int
    var engineState: EngineState = .stopped
    var windowsState: WindowsState = .closed
    
    // Sport car props
    let carType = "Sport car"
    let spoiler: Bool
    var nitroState: NitroState = .off
    
    // Sport car methods
    init(
        model: String,
        manufactureYear: Int,
        spoiler: Bool) {
        self.model = model
        self.manufactureYear = manufactureYear
        self.spoiler = spoiler
    }
    
    deinit {
        print("\(model) was removed from this world")
    }
    
    func nitroAction(_ action: NitroActions) {
        switch action {
        case .turnOn:
            if engineState == .stopped {
                print("Start the engine first.")
            } else if nitroState == .on {
                print("Nitro is on already.")
            } else {
                print(NitroActions.turnOn.rawValue)
                nitroState = .on
            }
        case .turnOff:
            if nitroState == .off {
                print("Nitro is off already.")
            } else {
                print(NitroActions.turnOff.rawValue)
                nitroState = .off
            }
        }
    }
}

extension SportCar: CustomStringConvertible {
    var description: String {
        return
            """
            *** My \(carType) info ***
            Model: \(model)
            Manufacture year: \(manufactureYear)
            Engine state: \(engineState)
            Windows state: \(windowsState)
            Nitro state: \(nitroState)
            Spoiler: \(spoiler ? "available" : "none")\n
            """
    }
}
