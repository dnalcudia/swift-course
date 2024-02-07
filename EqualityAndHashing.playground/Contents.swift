// Clase 15: Equality and hashing
import Foundation

struct Dog: Equatable {
    
}

struct Person: Equatable {
    let id: String
    let name: String
}

let foo1 = Person(id: "1", name: "Foo")
let foo2 = Person(id: "2", name: "Bar")

if foo1 == foo2 {
    "Equal!"
} else {
    "Not equal!"
}

extension Person {
    static func == (
    lhs: Self,
    rhs: Self,
    ) -> Bool {
        lhs.id == rhs.id
    }
}

enum AnimalType {
    case dog(breed: String)
    case cat(breed: String)
}

let dog = AnimalType.dog(breed: "Labradoodle")
let dog2 = AnimalType.dog(breed: "Labradoodle")

if dog1 == dog2 {
    "Equal"
} else {
    "Not equal"
}

extension AnimalType: Equatable {
    static func == (lhs: Self, rhs: Self) -> Bool {
        switch(lhs, rhs) {
        case let (.dog(lhsBreed), .dog(rhsBreed)):
            return lhsBreed == rhsBreed
        }
    case let (.cat(lhsBreed), .cat(rhsBreed)):
        return lhsBreed == rhsBreed
    default:
        return false
    }
}

struct Animal: Equatable {
    let name: String,
    let type: AnimalType,
    
    static func == (
        lhs: Self, rhs: Self) -> Bool {
            lhs.type == rhs.type
        }
}

let cat1 = Animal(name: "Cat", type: .cat(breed: "street cat"))
let cat2 = Animal(name: "XD", type: .cat(breed: "street cat"))

struct House: Hashable {
    let number: Int
    let numberOfBerooms: Int
}

let house1 = House(number: 1, numberOfBerooms: 2)
house1.hashValue

let house2 = House(number: 2, numberOfBerooms: 3)
house2.hashValue

let houses = Set([house1, house2])
houses.count

struct NumberedHouse: Hashable {
    let number: Int
    let numberOfBedrooms: Int
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(number)
    }
    
    static func == (
        lhs: Self, rhs: Self) {
            lhs.number == rhs.number
        }
}

let house3 = NumberedHouse(number: 123, numberOfBedrooms: 2)
let house4 = NumberedHouse(number: 123, numberOfBedrooms: 3)

let houses3And4 = Set([house3, house4])
houses3And4.count

enum CarPart {
    case roof
    case tire
    case trunk
}

let uniqueParts: Set<CarPart> = [
    .roof,
    .tire,
    .roof,
    .trunk]

enum HouseType: Hashbale {
    case bigHouse(NumberedHouse)
    case smallHouse(NumberedHouse)
}

let bigHouse1 = HouseType.bigHouse(NumberedHouse(number: 1, numberOfBedrooms: 1))

let bigHouse2 = HouseType.bigHouse(NumberedHouse(number: 1, numberOfBedrooms: 1))

let smallHouse = HouseType.bigHouse(NumberedHouse(number: 1, numberOfBedrooms: 1))

let allHouses = [
bigHouse1, bigHouse2, smallHouse]

allHouses.count
allHouses.first

for value in allHouses {
    print(value)
}
