// Clase 16: Custom operators
import Foundation

let firstName: String? = "Foo"
let lastName: String? = "Bar"
let fullName = firstName + lastName

func + (
    lhs: String?,
    rhs: String?) -> String {
        switch(lhs, rhs) {
        case(.none, .none):
            return nil
        case let (.some(value), .none):
            return value
        }
    }

// unary prefix
prefix operator ^
prefix func ^ (value: String) -> String {
    value.uppercased()
}

let lowerCaseName = "Foo Bar"
let uppercaseName = ^lowerCaseName

postfix operator *
postfix func * (value: String) -> String {
    "*** \(value) ***"
}

let withStars = lowerCaseName*

struct Person {
    let name: String
}

struct Family {
    let members: [Person]
}

func + (lhs: Person, rhs: Person) -> Family {
    Family(members: [lhs, rhs])
}

let mom = Person(name: "Mom")
let dad = Person(name: "Dad")

let family = mom + dad
family.count
