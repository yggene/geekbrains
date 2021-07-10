import Cocoa

let driving = { (place: String) in
    print("I'm driving to \(place)!")
}

func travel(action: (String) -> Void) {
    print("You know what?")
    action("London")
    print("And that is fucking great!")
}

travel(action: driving)

travel { (place: String) in
    print("I'm driving to \(place)!")
}
