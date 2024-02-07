// Clase 3: If-Else Daniel
import Foundation

let myName = "Daniel"
let myAge = 25
let yourName = "Foo"
let yourAge = 19

if myName == "daniel" {
    "Your name is \(myName)"
} else {
    "Oops, I guessed it wrong"
}

if myName == "Daniel" {
    "Now I guessed correctly"
} else if myName == "Foo" {
    "Are you foo?"
} else {
    "Ok, I give up"
}

if myName == "Daniel" && myAge == 30 {
    "Name is Daniel and age is 30"
} else if myAge == 25 {
    "I only guessed the age"
} else {
    "I dont know what I am doing"
}

if myName == "Daniel"
    && myAge == 22
    && yourName == "Foo"
    || yourAge == 19 {
    "My name is Daniel, my age is 22 and your name is Foo... OR you are is 19"
}
