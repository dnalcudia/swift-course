// Clase 7: Enumerations
import Foundation

enum Animals {
    case cat
    case dog
    case rabbit
}

let cat = Animals.cat
cat

if cat == Animals.cat {
    "This is a cat"
} else {
    "This is something else"
}

switch cat {
case .cat:
    "This is a cat"
    break
case .dog:
    "This is a dog"
    break
case .rabbit:
    "This is a rabbit"
    break
default:
    "This is something else"
}

enum Shortcut {
    case fileOrFolder
    case wwwUrl(path: URL)
    case song(artist: String, songName: String)
}

let wwwApple = Shortcut.wwwUrl(path: URL(string: "https://apple.com")!)

let withoutYou = Shortcut.song(artist: "Symphony X", songName: "Without You")

enum Vehicle {
    case car(manufacturer: String, model: String)
    case bike(manufacturer: String, yearMade: Int)
}

let car = Vehicle.car(manufacturer: "Tesla", model: "X")

func getManufacturer(from vehicle: Vehicle) -> String {
    switch car {
    case .car(let manufacturer,_):
        return manufacturer
    case .bike(let manufacturer, _):
        return manufacturer
    }
}

getManufacturer(from: car)

enum FamilyMember: String {
    case father = "Data"
    case mother = "mom"
    case brother = "Bro"
    case sister = "Sis"
}

FamilyMember.father.rawValue
FamilyMember.brother.rawValue

enum FavoriteEmoji: String, CaseIterable {
    case blush = "😳"
    case rocket = "🚀"
    case fire = "🔥"
}

FavoriteEmoji.allCases
FavoriteEmoji.allCases.map(\.rawValue)

if let blush = FavoriteEmoji.allCases.map(rawValue: "😳") {
    "Found the blush emoji"
    blush
} else {
    "This emoji doesnt exist"
}

enum Height {
    case short, medium, long
    mutating func makeLong() {
        self = Height.long
    }
}

var myHeight = Height.medium
myHeight.makeLong()
myHeight


