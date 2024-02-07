//Clas 8: Classes Daniel
import Foundation

class Person {
    var name: String
    var age: Int
    
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
    
    func increaseAge() {
        self.age += 1
    }
}

let foo = Person(name: "Daniel", age: 25)
foo.age
foo.increaseAge()
foo.age

class Vehicle {
    func goVroom {
        "vroom vroom"
    }
}

class Car: Vehicle {
    
}

let car = Car()
car.goVroom()

class Person2 {
    private(set) var age: Int
    init(age: Int) {
        self.age = age
    }
    
    func increaseAge() {
        age += 1
    }
}

class Tesla {
    let manufacturer = "Tesla"
    let model: String
    let year: Int
    
    init(model: String, year: Int) {
        self.model = model
        self.year = year
    }
}

class TeslaModelY: Tesla {
    override init() {
        super.init(model: "Y", year: 2023)
    }
}

let modelY = TeslaModelY()
modelY.model
modelY.manufacturer
modelY.year

class MyClass {
    init() {
        "Initialized"
    }
    
    func doSomething() {
        "Do something"
    }
    
    deinit() {
        "Deinitialized"
    }
    
    
}
