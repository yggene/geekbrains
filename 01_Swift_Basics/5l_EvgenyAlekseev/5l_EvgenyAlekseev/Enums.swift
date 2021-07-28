//
//  Enums.swift
//  5l_EvgenyAlekseev
//
//  Created by Evgeny Alekseev on 25.07.2021.
//

// Engine enums
enum EngineActions: String {
    case start = "Starting the engine..."
    case stop = "Shutting the engine off..."
}

enum EngineState {
    case started
    case stopped
}

// Windows enums
enum WindowsActions: String {
    case open = "Opening the windows..."
    case close = "Closing the windows..."
}

enum WindowsState {
    case opened
    case closed
}

// Nitro enums
enum NitroActions: String {
    case turnOn = "Woo-hoo! This is some serious shit, man!"
    case turnOff = "You coward!"
}

enum NitroState {
    case on
    case off
}

// Trunk enums
enum TrunkActions {
    case loadIntoTrunk(_ volume: Double)
    case unloadFromTrunk(_ volume: Double)
}

enum LuggageErrors: String {
    case maxVolumeExceeded = "Maximum volume exceeded."
    case insuficientLuggage = "Not enough luggage."
}
