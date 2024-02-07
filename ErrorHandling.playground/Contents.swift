// Clase 13: Error Handling
import Foundation

struct Person {
    let firstName: String?
    let lastName: String?
    
    enum Errors: Error {
        case firstNameIsNil
        case lastNameIsNil
        case bothNameAreNil
    }
    
    func getFullName() throws -> String {
        switch(firstName, lastName) {
        case (.none, .none):
            throw Errors.bothNameAreNil
        case (.none, .some):
            throw Errors.firstNameIsNil
        case (.some, .none):
            throw Errors.lastNameIsNil
        }
    }
}

let foo = Person(firstName: "Daniel", lastName: "Alcudia")

do {
    let fullName = try foo.getFullName()
} catch let e {
    "Got an error = \(e)"
}

do {
    let fullName = try foo.getFullName()
    fullName
} catch is Person.Errors {
    "Got an error"
}

let bar = Person(firstName: nil, lastName: nil)
do {
    let fullName = try foo.getFullName()
    fullName
} catch is Person.Errors.bothNameAreNil {
    "Both names are nil"
} catch {
    "Some other error was thrown"
}

struct Car {
    let manufacturer: String
    
    enum Errors: Error {
        case invalidadManufacturer
    }
    
    init(manufacturer: String) throws {
        if manufacturer.isEmpty {
            throw Errors.invalidadManufacturer
        }
        self.manufacturer = manufacturer
    }
}

do {
    let myCar = Car(manufacturer: "")
    myCar
    myCar.manufacturer
} catch Car.Errors.invalidadManufacturer {
    "Invalid manufacturer"
} catch {
    "Some other error"
}

if let yourCar = try? Car(manufacturer: "Tesla") {
    "Success!"
} else {
    "Failed :("
}

let theirCar = try! Car(manufacturer: "Ford")
theirCar.manufacturer

struct Dog {
    let isInjured: Bool
    let isSleeping: Bool
    
    enum BarkingErrors:Error {
        case cannotBarkIsSleeping
    }
    
    enum RunningErrors: Error {
        case cannotRunIsInjured
    }
    
    func bark() {
        if isSleeping {
            throw BarkingErrors.cannotBarkIsSleeping
        }
        "Bark.."
    }
    
    func run() {
        if isInjured {
            throw RunningErrors.cannotRunIsInjured
        }
        "Run..."
    }
    
    func barkAndRun() throws {
        try bark()
        try run()
    }
}

let dog = Dog(isInjured: true, isSleeping: true)

do {
    try dog.barkAndRun()
} catch Dog.BarkingErrors.cannotBarkIsSleeping, Dog.RunningErrors.cannotRunIsInjured {
    "Cannot bark is sleeping, or cannot run is injured"
} catch {
    "Some other error"
}

do {
    try dog.barkAndRun()
} catch Dog.BarkingErrors.cannotBarkIsSleeping {
    "Cannot bark is sleeping"
} catch Dog.RunningErrors.cannotRunIsInjured {
    "Cannot run is injured"
} catch {
    "Some other error"
}

func fullName(firstName: String?, lastName: String?, calculator: (String?, String?) throws -> String?) rethrows -> String? {
    try calculator(firstName, lastName)
}

enum NameErrors: Error {
    case firstNameIsInvalid
    case lastNameIsInvalid
}

func + (
    firstName: String?, lastName: String?) throws -> String? {
        guard let firstName, !firstName.isEmpty else {
            throws NameErrors.firstNameIsInvalid
        }
        guard let lestName, !lastName?.isEmpty else {
            throw NameErrors.lastNameIsInvalid
        }
        return "\(firstName) \(lastName)"
    }

do {
    let fooBar = try fullName(firstName: nil, lastName: nil, calculator: +)
} catch NameErrors.firstNameIsInvalid {
    "First name is invalid"
} catch NameErrors.lastNameIsInvalid {
    "Last name is invalid"
} catch {
    "Some other error"
}

enum IntegerErrors: Error {
    case noPositiveIntegerBefore(thisValue: int)
}

func getPreviousInteger(from int: Int) -> Result<Int, IntegerErrors> {
    guard int > 0 else {
        return Result.failure(IntegerErrors.noPositiveIntegerBefore(thisValue: int))
    }
    return Result.success(int - 1)
}

func performGet(forValuye value: int) {
    switch getPreviousInteger(from: value) {
    case let .success(previousValue):
        "Previous value is \(previousValue)"
    case let .failure(error):
        switch error {
        case let .noPositiveIntegerBefore(thisValue):
            "No positive integer before \(thisValue)"
        }
    }
}

performGet(forValuye: 0)
performGet(forValuye: 2)
