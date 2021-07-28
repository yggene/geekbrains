//
//  Car.swift
//  5l_EvgenyAlekseev
//
//  Created by Evgeny Alekseev on 25.07.2021.
//

protocol CarProtocol: AnyObject {
    // Car properties
    var model: String { get }
    var manufactureYear: Int { get }
    var engineState: EngineState { get set }
    var windowsState: WindowsState { get set }
    
    // Car methods
    func engineAction(_ action: EngineActions)
    func windowsAction(_ action: WindowsActions)
}

extension CarProtocol {
    
    func engineAction(_ action: EngineActions) {
        switch action {
        case .start:
            if engineState == .started {
                print("The engine is started already")
            } else {
                print(EngineActions.start.rawValue)
                engineState = .started
            }
        case .stop:
            if engineState == .stopped {
                print("The engine is stopped already")
            } else {
                print(EngineActions.stop.rawValue)
                engineState = .stopped
            }
        }
    }
    
    func windowsAction(_ action: WindowsActions) {
        switch action {
        case .open:
            if windowsState == .opened {
                print("The windows are opened already")
            } else {
                print(WindowsActions.open.rawValue)
                windowsState = .opened
            }
        case .close:
            if windowsState == .closed {
                print("The engine is stopped already")
            } else {
                print(WindowsActions.close.rawValue)
                windowsState = .closed
            }
        }
    }
}
