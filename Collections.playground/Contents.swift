//Clase 14: Collections

import Foundation

let numbers = [1,2,3,4]
numbers.first
numbers.last
numbers.count
numbers.map(-)

var mutatingNumbers = [0,1,2]
mutatingNumbers.append(3)
mutatingNumbers.insert(3, at: 0)
mutatingNumbers.insert(contentsOf: [1,2], at: 0)

for value in numbers {
    value
}

for value in numbers where value % 2 == 0 {
    value
}

let values = numbers.map { (value: Int) -> Int in value * 2 }
values

numbers.filter { (value: Int) -> Bool in value >= 3}

numbers.compactMap { (value: Int) -> String? in value % 2 == 0 ? String(value) : nil}

let numbers2: [Int?] = [1,2,nil,4,5]
numbers2.count

let notNils = numbers2.filter { (value: Int?) -> Bool in value != nil}

notNils

let numbers3 = [1,2,1,2]
numbers3.count

let stuff1 = [
1, "Hello", 2, "World!"] as [Any]

stuff1.count

let stuff2: [Any] = [
1, "Hello", 2, "World!"] as [Any]
stuff2.count

let uniqueNumbers = Set([1,2,1,2,3])
uniqueNumbers.count
uniqueNumbers.map(-)

let myNumbers = Set([1,2,3,nil,5])
let notNilNumbers = Set(myNumbers.compactMap {
    $0
})
notNilNumbers

let stuff3: Set<AnyHashable>  = [1,2,3, "Vandad"]
stuff3.count

let intsInStuff1 = stuff1.compactMap { (value: Any) -> Int? in value as? Int }

let intsInStuff3 = stuff3.compactMap { (value: AnyHashable) -> Int? in value as? Int }

type(of: intsInStuff3)

struct Person: Hashable {
    let id: UUID
    let name: String
    let age: Int
}

let fooId = UUID()
let foo = Person(id: fooId, name: "Foo", age: 20)
let bar = Person(id: fooId, name: "Bar", age: 30)

let people: Set<Person> = [foo,bar]
people.count

struct Person2: Hashable {
    let id: UUID
    let name: String
    let age: Int
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    static func == (
    lhs: Self, rhs: Self
    ) -> Bool {
        lhs.id == rhs.id
    }
}

let bazId = UUID()
let baz = Person2(
    id: bazId, name: "Baz", age: 20)
let quz = Person2(
    id: bazId, name: "Quz", age: 30)

let people2 = Set([baz, quz])
people2.first!.name

let userINfo = [
    "name": "Foo",
    "age": 20,
    "address": [
        "line1": "Address line 1",
    "postCode: "12345"
    ]] as [String: any]

userINfo["name"]
userINfo["age"]
userINfo["address"]
(userINfo["address"] as ! [String: String])["postCode"]

userINfo.keys
userINfo.values

for (key, value) in userINfo {
    print(key)
    print(value)
}

for (key,value) in userINfo where value is Int && key.count > 2 {
    key
    value
}


