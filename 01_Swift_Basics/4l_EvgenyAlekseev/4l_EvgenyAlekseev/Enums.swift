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

enum NitroState: String {
    case on = "Woo-hoo! This is some serious shit, man!"
    case off = "You coward!"
}

enum CarActions {
    case startEngine
    case stopEngine
    case openWindows
    case closeWindows
    case nitroOn
    case nitroOff
    case loadIntoTrunk(_ volume: Double)
    case unloadFromTrunk(_ volume: Double)
}

enum LuggageErrors: String {
    case maxVolumeExceeded = "Maximum volume exceeded."
    case insuficientLuggage = "Not enough luggage."
}
