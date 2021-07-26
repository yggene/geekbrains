//
//  Truck.swift
//  4l_EvgenyAlekseev
//
//  Created by Evgeny Alekseev on 22.07.2021.
//

class TrunkCar: Car {
    // Constants
    let carType = "Trunk car"
    let maxTrunkVolume: Double
    
    // Variables
    private var currentTrunkLoad = 0.0 
    var trunkVolumeAvailable: Double {
        get {
            maxTrunkVolume - currentTrunkLoad
        }
    }
    
    // Methods
    init(
        model: String,
        manufactureYear: Int,
        engineState: EngineState,
        windowsState: WindowsState,
        maxTrunkVolume: Double) {
        self.maxTrunkVolume = maxTrunkVolume
        super.init(
            model: model,
            manufactureYear: manufactureYear,
            engineState: engineState,
            windowsState: windowsState)
    }
    
    override func carAction(_ action: CarActions) {
        switch action {
        case let .loadIntoTrunk(volume):
            if volume > trunkVolumeAvailable {
                print(LuggageErrors.maxVolumeExceeded.rawValue,
                      "Volume available: \(currentTrunkLoad)")
            } else {
                currentTrunkLoad += volume
                print("""
                      Loading...
                      \(volume) loaded!
                      Current trunk load: \(currentTrunkLoad).
                      Trunk volume available: \(trunkVolumeAvailable).
                      """
                      )
            }
        case let .unloadFromTrunk(volume):
            if volume > currentTrunkLoad {
                print(LuggageErrors.insuficientLuggage.rawValue,
                      "Current load:",
                      currentTrunkLoad)
            } else {
                currentTrunkLoad -= volume
                print("""
                      Unloading...
                      \(volume) unloaded!
                      Current trunk load: \(currentTrunkLoad).
                      Trunk volume available: \(trunkVolumeAvailable).
                      """)
            }
        default:
            super.carAction(action)
        }
    }
    
    override func printInfo() {
        print("*** My \(carType) info ***")
        super.printInfo()
        print("""
              Max trunk volume: \(maxTrunkVolume)
              Current trunk load: \(currentTrunkLoad)
              Available trunk volume: \(trunkVolumeAvailable)\n
              """)
    }
}
