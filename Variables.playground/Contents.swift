// Clase 1: Daniel Alcudia

import Foundation

let myName = "Daniel"
let yourName = "Foo"

var names = [
myName, yourName
]

names.append("Bar")
names.append("Baz")

let moreNames = [
"Foo", "Bar"]

var copy = moreNames
copy.append("Baz")
moreNames
copy

let oldArray = NSMutableArray(
    array: [
    "Foo",
    "Bar"])
oldArray.add("Baz")
var newArray = oldArray
newArray.add("Qux")
newArray
oldArray

let someNames = NSMutableArray(
    array: [
    "Foo",
    "Bar"])

func changeTheArray(_ array: NSArray) {
    let copy = array as! NSMutableArray
    copy.add("Baz")
}

changeTheArray(someNames)
someNames
