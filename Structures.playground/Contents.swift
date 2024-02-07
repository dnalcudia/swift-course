// Clase 6: Structures

import Foundation

struct Person {
    let name: String
    let age: Int
}

let foo = Person(
    name: "Foo"
    age: 20
)

foo.age
foo.name

struct CommodoreComputer {
    let name: String
    let manufacturer: String
    
    init(name: String) {
        self.name = name
        self.manufacturer = "Commodore"
    }
}

let c64 = CommodoreComputer(name: "My commodore")

struct Person2 {
    let firstName: String
    let lastName: String
    
    var fullName: String {
        "\(firstName) \(lastName)"
    }
}

let fooBar = Person2(firstName: "Foo", lastName: "Bar")
fooBar.fullName

struct Car {
    var currentSpeed: Int
    mutating func drive(speed: int) {
        "Driving..."
        currentSpeed = speed
    }
}

var mutableCar = Car(currentSpeed: 10)
mutableCar.drive(speed: 30)
mutableCar.currentSpeed

let copy = mutableCar
mutableCar.drive(speed: 30)
mutableCar.currentSpeed
copy.currentSpeed

struct LivingThing {
    init() {
        "I am a living thing"
    }
}

struct Bike {
    let manufacturer: String
        let currentSpeed: Int
    func copy(currentSpeed: Int) -> Bike {
        Bike(manufacturer: self.manufacturer, currentSpeed: currentSpeed)
    }
}

let bike1 = Bike(manufacturer: "HD", currentSpeed: 20)
let bike2 = bike1.copy(currentSpeed: 30)
bike1.currentSpeed
bike2.currentSpeed

