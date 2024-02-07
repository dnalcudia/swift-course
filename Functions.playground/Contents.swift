// Clase 4 Daniel: Functions
import Foundation

func noArgumentsAndNoReturnValue() {
    "I dont know what i am doing"
}

noArgumentsAndNoReturnValue()

func plusTwo(value: Int) {
    let newValue = value + 2
}

plusTwo(value: 30)

func newPlusTwo(value: Int) -> Int {
    value + 2
}

newPlusTwo(value: 30)

func customAdd(value1: Int, value2: Int) -> Int {
    value1 + value2
}

let customAdded = customAdd(value1: 10, value2: 20)

func customMinus(_ lhs: Int, _ rhs: Int) -> Int {
    lhs - rhs
}

let customSubtractec = customMinus(20, 10)

func myCustomAdd(
    _ lhs: Int, _ rhs: Int) -> Int {
        lhs + rhs
    }

func doSomethingComplicated(with value: Int) -> Int {
    func magicLogic(value: Int) -> Int {
        value + 2
    }
    return magicLogic(value: value + 3)
}

doSomethingComplicated(with: 30)

func getFullName(firstName: String = "Foo", lastName: String = "Bar") -> String {
    "\(firstName) \(lastName)"
}

getFullName()
getFullName(firstName: "Baz")
getFullName(lastName: "Foo")
