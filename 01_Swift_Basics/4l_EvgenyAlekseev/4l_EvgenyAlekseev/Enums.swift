//
//  Enums.swift
//  4l_EvgenyAlekseev
//
//  Created by Evgeny Alekseev on 22.07.2021.
//

enum EngineState: String {
    case started = "Starting the engine..."
    case stopped = "Shutting the engine off..."
}

enum WindowsState: String {
    case opened = "Opening the windows..."
    case closed = "Closing the windows..."
}

enum CarActions {
    case startEngine
    case stopEngine
    case openWindows
    case closeWindows
}

enum SportCarActions {
    case nitroOn
    case nitrOff
}

enum TrunkCarActions {
    case loadIntoTrunk(_ volume: Double)
    case unloadFromTrunk(_ volume: Double)
}

enum LuggageErrors: String {
    case maxVolumeExceeded = "Maximum volume exceeded."
    case insuficientLuggage = "Not enough luggage."
}
