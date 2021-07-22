//
//  Truck.swift
//  4l_EvgenyAlekseev
//
//  Created by Evgeny Alekseev on 22.07.2021.
//

class TrunkCar: Car {
    let maxTrunkVolume: Double
    
    // Variables
    var currentTrunkLoad = 0.0
    var trunkVolumeAvailable: Double {
        get {
            maxTrunkVolume - currentTrunkLoad
        }
    }
    
    func carAction(_ action: TrunkCarActions) {
        switch action {
        case let .loadIntoTrunk(volume):
            if volume > trunkVolumeAvailable {
                print(LuggageErrors.maxVolumeExceeded.rawValue,
                      "Volume available:",
                      trunkVolumeAvailable)
            } else {
            currentTrunkLoad += volume
            print("\(volume) loaded! Trunk volume available: \(trunkVolumeAvailable)")
            }
        case let .unloadFromTrunk(volume):
            if volume > currentTrunkLoad {
                print(LuggageErrors.insuficientLuggage.rawValue, "Luggage stored:", currentTrunkLoad)
            } else {
            currentTrunkLoad -= volume
            print("\(volume) unloaded! Body volume available: \(trunkVolumeAvailable)")
            }
        }
    }
    
}
