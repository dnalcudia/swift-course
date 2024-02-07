// Clase 12: Optionals
import Foundation

func multiplyByTwo(_ value: Int? = nil) -> Int {
    if let value {
        return value * 2
    } else {
        return 0
    }
}

multiplyByTwo(2)

let age: Int? = nil
if age != nil {
    "Age is there! How odd!"
} else {
    "Age is nil. Correct."
}

func checkAge() {
    guard age != nil else {
        "Age is nil as expected"
        return
    }
    "Age is not nil here. Strange!"
}

let age2: Int? = 0
func checkAge2() {
    guard age2 != nil else {
        "Age is nil as expected"
        return
    }
    "Age is not nil here. Strange!"
}

switch age {
case .none:
    "No value"
case .some(value):
    "Has some value: \(value)"
}

if age2 == .some(0) {
    "Age2 is 0 as expected, and is not nil"
} else {
    "Age2 is not 0. How strange!"
}

struct Person {
    let name: String
    let address: Address?
    
    struct Address {
        let firstLine: String?
    }
}

let foo: Person = Person(name: "Foo", address: nil)

let baz: Person? = Person(name: "Baz", address: Person.Address(firstLine: "Baz first line"))

switch baz?.address?.firstLine {
case let .some(firstLine) where firstLine.starts(with: "Baz"):
    "Baz first address line: \(firstLine)"
case let .some(firstLine):
    "Baz first address line that didnt match the previous case"
case .none:
    "Baz first address line is nil?? Weird!"
}
