// Clase 9: Protocols Daniel
import Foundation

protocol CanBreathe {
    func breathe()
}

struct Person: CanBreathe {
    func breathe() {
        "Person breathing..."
    }
}

let foo = Person()
foo.breathe()

protocol CanJump {
    func jump() {
        "Jumping..."
    }
}

extension CanJump {
    func jump() {
        "Jumping..."
    }
}

struct Cat: CanJump {
    
}

let whiskers = Cat()
whiskers.jump()

protocol HasName {
    var name: String { get }
    var age: Int { get set }
    mutating func increaseAge()
}

extension HasName {
    func describeMe() {
        "Your name is \(name) and your \(age) years old"
    }
    func increaseAge() {
        self.age += 1
    }
}

struct Dog: HasName {
    let name: String
    var age: Int
}

let woof = Dog(name: "woof", age: 10)
woof.name
woof.age
woof.describeMe()
woof.increaseAge()
woof.age

protocol Vehicle {
    var speed: Int {get set}
    mutating func increaseSpeed(by value:Int)
}

extension Vehicle {
    mutating func increaseSpeed(by value:Int) {
        self.speed += value
    }
}

struct Bike: Vehicle {
    var speed: Int = 0
    
}
