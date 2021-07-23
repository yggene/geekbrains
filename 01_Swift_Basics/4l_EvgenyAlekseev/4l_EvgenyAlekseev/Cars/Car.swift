//
//  Car.swift
//  4l_EvgenyAlekseev
//
//  Created by Evgeny Alekseev on 22.07.2021.
//

class Car {
    // Constants
    let model: String
    let manufactureYear: Int
    
    // Variables
    private(set) var engineState: EngineState {
        didSet {
            print(engineState.rawValue)
        }
    }
    
    private(set) var windowsState: WindowsState {
        didSet {
            print(windowsState.rawValue)
        }
    }
    
    // Methods
    init(
        model: String,
        manufactureYear: Int,
        engineState: EngineState,
        windowsState: WindowsState) {
        self.model = model
        self.manufactureYear = manufactureYear
        self.engineState = engineState
        self.windowsState = windowsState
    }
    
    deinit {
        print("\(model) was removed from this world.")
    }
    
    func carAction(_ action: CarActions) {
        switch action {
        case .startEngine:
            if engineState == .started {
                print("Hey, you've already started it!")
            } else {
                engineState = .started
            }
        case .stopEngine:
            if engineState == .stopped {
                print("Hey, you're not driving yet!")
            } else {
                engineState = .stopped
            }
        case .openWindows:
            if windowsState == .opened {
                print("The windows are opened already.")
            } else {
                windowsState = .opened
            }
        case .closeWindows:
            if windowsState == .closed {
                print("The windows are closed already.")
            } else {
                windowsState = .closed
            }
        default:
            print("Action not available for this car type.")
        }
    }
    
    func printInfo() {
        print("""
              Model: \(model)
              Manufacture year: \(manufactureYear)
              Engine state: \(engineState)
              Windows state: \(windowsState)
              """)
    }
}
