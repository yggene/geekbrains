//
//  TrunkCar.swift
//  5l_EvgenyAlekseev
//
//  Created by Evgeny Alekseev on 25.07.2021.
//

class TrunkCar: CarProtocol {
    
    // Car protocol props
    let model: String
    let manufactureYear: Int
    var engineState: EngineState = .stopped
    var windowsState: WindowsState = .closed
    
    // Trunk car props
    let carType = "Trunk car"
    let maxTrunkVolume: Double
    private var currentTrunkLoad = 0.0
    var trunkVolumeAvailable: Double {
        get {
            maxTrunkVolume - currentTrunkLoad
        }
    }
    
    // Trunk car methods
    init(
        model: String,
        manufactureYear: Int,
        maxTrunkVolume: Double) {
        self.model = model
        self.manufactureYear = manufactureYear
        self.maxTrunkVolume = maxTrunkVolume
    }
    
    deinit {
        print("\(model) was removed from this world")
    }
    
    func trunkAction(_ action: TrunkActions) {
        switch action {
        case let .loadIntoTrunk(volume):
            if volume > trunkVolumeAvailable {
                print(LuggageErrors.maxVolumeExceeded.rawValue,
                      "Volume available: \(trunkVolumeAvailable)")
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
        }
    }
}

extension TrunkCar: CustomStringConvertible {
    var description: String {
        return
            """
            *** My \(carType) info ***
            Model: \(model)
            Manufacture year: \(manufactureYear)
            Engine state: \(engineState)
            Windows state: \(windowsState)
            Max trunk volume: \(maxTrunkVolume)
            Current trunk load: \(currentTrunkLoad)
            Available trunk volume: \(trunkVolumeAvailable)\n
            """
    }
}
