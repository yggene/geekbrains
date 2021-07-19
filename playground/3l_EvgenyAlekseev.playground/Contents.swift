import Foundation

// creating enums
enum EngineState {
    case started, stopped
}

enum WindowsState: String {
    case opened = "Opening the windows..."
    case closed = "Closing the windows..."
}

enum LuggageActions {
    case loadIntoBody(volume: Double)
    case unloadFromBody(volume: Double)
    case loadIntoTrunk(volume: Double)
    case unloadFromTrunk(volume: Double)
}

enum LuggageErrors: String {
    case maxVolumeExceeded = "Maximum volume exceeded."
    case insuficientLuggage = "Not enough luggage."
}

// creating Sport car struct
struct SportCar {
    
    // fixed values
    let model: String
    let manufactureYear: Int
    let maxBodyVolume: Double
    let maxTrunkVolume: Double
    
    // dynamic values
    var currentBodyLoad = 0.0
    var currentTrunkLoad = 0.0
    var bodyVolumeAvailable: Double {
        get {
            maxBodyVolume - currentBodyLoad
        }
    }
    
    var trunkVolumeAvailable: Double {
        get {
            maxTrunkVolume - currentTrunkLoad
        }
    }
    
    var engineState: EngineState {
        willSet {
            switch newValue {
            case .started:
                print("VRRROOOOOMMM-VRRROOOOOMMMM!")
            case .stopped:
                print("Pshhhh...")
            }
        }
    }
    
    var windowsState: WindowsState {
        didSet {
            print(windowsState.rawValue)
        }
    }
    
    // Sport car methods
    mutating func startEngine() -> EngineState {
        guard engineState == .stopped else {
            print("Hey, you've already started it!")
            return engineState
        }
        engineState = .started
        return engineState
    }
    
    mutating func stopEngine() -> EngineState {
        guard engineState == .started else {
            print("Hey, you're not driving yet!")
            return engineState
        }
        engineState = .stopped
        return engineState
    }
    
    mutating func openWindows() -> WindowsState {
        guard windowsState == .closed else {
            print("The windows are opened already")
            return windowsState
        }
        windowsState = .opened
        return windowsState
    }
    
    mutating func closeWindows() -> WindowsState {
        guard windowsState == .opened else {
            print("The windows are closed already")
            return windowsState
        }
        windowsState = .closed
        return windowsState
    }
    
    mutating func luggage(action: LuggageActions) {
        switch action {
        case let .loadIntoBody(volume):
            if volume > bodyVolumeAvailable {
                print(LuggageErrors.maxVolumeExceeded.rawValue, "Volume available:", bodyVolumeAvailable)
            } else {
                currentBodyLoad += volume
                print("\(volume) loaded! Body volume available: \(bodyVolumeAvailable)")
            }
        case let .unloadFromBody(volume):
            if volume > currentBodyLoad {
                print(LuggageErrors.insuficientLuggage.rawValue, "Luggage stored:" , currentBodyLoad)
            } else {
                currentBodyLoad -= volume
                print("\(volume) unloaded! Body volume available: \(bodyVolumeAvailable)")
            }
        case let .loadIntoTrunk(volume):
            if volume > trunkVolumeAvailable {
                print(LuggageErrors.maxVolumeExceeded.rawValue, "Volume available:", trunkVolumeAvailable)
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
    
    func printInfo() {
        print("Model: \(model)")
        print("Manufacture year: \(manufactureYear)")
        print("Maximum body volume: \(maxBodyVolume)")
        print("Maximum trunk volume: \(maxTrunkVolume)")
        print("Current body load: \(currentBodyLoad)")
        print("Current trunk load: \(currentTrunkLoad)")
        print("Body volume available: \(bodyVolumeAvailable)")
        print("Trunk volume available: \(trunkVolumeAvailable)")
        print("Engine state: \(engineState)")
        print("Windows state: \(windowsState)")
    }
}

struct TrunkCar {
    
    // fixed values
    let model: String
    let manufactureYear: Int
    let maxBodyVolume: Double
    let maxTrunkVolume: Double
    
    // dynamic values
    var currentBodyLoad = 0.0
    var currentTrunkLoad = 0.0
    var bodyVolumeAvailable: Double {
        get {
            maxBodyVolume - currentBodyLoad
        }
    }
    
    var trunkVolumeAvailable: Double {
        get {
            maxTrunkVolume - currentTrunkLoad
        }
    }
    
    var engineState: EngineState {
        willSet {
            switch newValue {
            case .started:
                print("Tr--tr--tr--tr-tr-tr-tr-trrrrrrrrrrr!")
            case .stopped:
                print("Pffffff...")
            }
        }
    }
    
    var windowsState: WindowsState {
        didSet {
                print(windowsState.rawValue)
        }
    }
    
    // Trunk car methods
    mutating func startEngine() -> EngineState {
        guard engineState == .stopped else {
            print("Hey, you've already started it!")
            return engineState
        }
        
        let i = Int.random(in: 1...100)
        switch i {
        case 1...55:
            engineState = .started
        case 56...100:
            print("Bad luck, man. Try starting this thing again.")
        default:
            break
        }
        return engineState
    }
    
    mutating func stopEngine() -> EngineState {
        guard engineState == .started else {
            print("Hey, you're not driving yet!")
            return engineState
        }
        engineState = .stopped
        return engineState
    }
    
    mutating func openWindows() -> WindowsState {
        guard windowsState == .closed else {
            print("The windows are opened already")
            return windowsState
        }
        windowsState = .opened
        
        if engineState == .started {
            let i = Int.random(in: 1...100)
            if i <= 20 {
                engineState = .stopped
                print("WTF, man?!")
            }
        }
        return windowsState
    }
    
    mutating func closeWindows() -> WindowsState {
        guard windowsState == .opened else {
            print("The windows are closed already")
            return windowsState
        }
        windowsState = .closed
        return windowsState
    }
    
    mutating func luggage(action: LuggageActions) {
        switch action {
        case let .loadIntoBody(volume):
            if volume > bodyVolumeAvailable {
                print(LuggageErrors.maxVolumeExceeded.rawValue, "Volume available:", bodyVolumeAvailable)
            } else {
                currentBodyLoad += volume
                print("\(volume) loaded! Body volume available: \(bodyVolumeAvailable)")
            }
        case let .unloadFromBody(volume):
            if volume > currentBodyLoad {
                print(LuggageErrors.insuficientLuggage.rawValue, "Luggage stored:" , currentBodyLoad)
            } else {
                currentBodyLoad -= volume
                print("\(volume) unloaded! Body volume available: \(bodyVolumeAvailable)")
            }
        case let .loadIntoTrunk(volume):
            if volume > trunkVolumeAvailable {
                print(LuggageErrors.maxVolumeExceeded.rawValue, "Volume available:", trunkVolumeAvailable)
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
    
    func printInfo() {
        print("Model: \(model)")
        print("Manufacture year: \(manufactureYear)")
        print("Maximum body volume: \(maxBodyVolume)")
        print("Maximum trunk volume: \(maxTrunkVolume)")
        print("Current body load: \(currentBodyLoad)")
        print("Current trunk load: \(currentTrunkLoad)")
        print("Body volume available: \(bodyVolumeAvailable)")
        print("Trunk volume available: \(trunkVolumeAvailable)")
        print("Engine state: \(engineState)")
        print("Windows state: \(windowsState)")
    }
}


var mySportCar = SportCar(model: "Lamborghini Urus", manufactureYear: 2021, maxBodyVolume: 616, maxTrunkVolume: 150, engineState: .stopped, windowsState: .closed)
var myTrunkCar = TrunkCar(model: "GAZ-51", manufactureYear: 1951, maxBodyVolume: 308, maxTrunkVolume: 2100, engineState: .stopped, windowsState: .closed)

// Print some properties using print()
print(mySportCar.model)
print(mySportCar.manufactureYear)
mySportCar.startEngine()
print(mySportCar.engineState)
mySportCar.openWindows()
print(mySportCar.windowsState)

print("\n*****************\n")

print(myTrunkCar.model)
print(myTrunkCar.manufactureYear)
myTrunkCar.startEngine()
print(myTrunkCar.engineState)
myTrunkCar.openWindows()
print(myTrunkCar.windowsState)

print("\n*****************\n")

// Print Trunk car properties using Mirror
let trunkCarMirror = Mirror(reflecting: myTrunkCar)
for child in trunkCarMirror.children  {
    print("key: \(String(reflecting: child.label)), value: \(child.value)")
}
print("\n*****************\n")

// Print Sports car properties using struct method
mySportCar.printInfo()

print("\n*****************\n")

// Testing luggage actions
mySportCar.luggage(action: .loadIntoBody(volume: 400))
myTrunkCar.luggage(action: .loadIntoTrunk(volume: 1000))
mySportCar.luggage(action: .unloadFromBody(volume: 300))
myTrunkCar.luggage(action: .unloadFromTrunk(volume: 900))
mySportCar.luggage(action: .unloadFromBody(volume: 300))
myTrunkCar.luggage(action: .unloadFromTrunk(volume: 900))
