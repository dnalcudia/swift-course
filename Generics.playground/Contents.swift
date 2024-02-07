// Clase 11: Generics Daniel
import Foundation
import CoreGraphics


func performDouble(_ op: (Double, Double) -> Double, on lhs: Double, and rhs: Double) -> Double {
    op(lhs, rhs)
}

func performInt(_ op: (Int, Int) -> Int, on lhs: Int, and rhs: Int) -> Int {
    op(lhs, rhs)
}

func perform<N: Numeric>(_ op: (N, N) -> N, on lhs: N, and rhs: N) -> N {
    op(lhs, rhs)
}

performDouble(+, on: 10, and: 20)
performDouble(-, on: 10, and: 20)
performDouble(*, on: 10, and: 20)
performDouble(/, on: 10, and: 20)

protocol CanJump() {
    func jump()
}

protocol CanRun() {
    func run()
}

struct Person: CanRun, CanRun {
    func jump() {
        "Jumping..."
    }
    
    func run() {
        "Running..."
    }
}

func jumpAndRun<T: CanJump & CanRun>(value: T) {
    value.jump()
    value.run()
}

let person = Person()
jumpAndRun(value: person)

extension [String] {
    func longestString() -> String? {
        self.sorted {
            (lhs: String, rhs: String) -> Bool in
            lhs.count > rhs.count
        }.first
    }
}

["foo", "bar baz", "qux"].longestString()
