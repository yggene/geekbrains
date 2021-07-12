import Cocoa

let driving = { (place: String, speed: Int) -> String in
    return "I'm driving to \(place) at \(speed) km/h!"
}

func travel(action: (String, Int) -> String) {
    print("You know what?")
    let description = action("London", 60)
    print(description)
    print("And that is fucking great!")
}

travel(action: driving)

func trip() -> (String) -> Void {
    return {
        print("I'm going to \($0)!")
    }
}

let result = trip()
result("London")
