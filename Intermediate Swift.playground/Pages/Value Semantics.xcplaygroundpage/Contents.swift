//: [Previous](@previous)

import UIKit

// Mutating values in Value Types
struct Point {
    var x: Double
    var y: Double
    
    mutating func moveLeft(steps: Double) {
        x -= steps
    }
}


var p1 = Point(x: 1, y: 2)
var p2 = p1

p1.x = 4
p2.x


let p3 = Point(x: 2, y: 4)

struct AnotherPoint {
    let x: Double
    let y: Double
}

var p4 = AnotherPoint(x: 1, y: 2)


// Mutating values in Reference Types
class Robot {
    
    var model: String
    init(model: String) {
        self.model = model
    }
}

var someRobot = Robot(model: "T1999")
var anotherRobot = someRobot

someRobot.model = "T2000"
anotherRobot.model

let thirdRobot = Robot(model: "T3000")
thirdRobot.model = "TXXX"


// Mixed Semantics
struct Shape {
    
    let shapeView: UIView
    
    init(width: CGFloat, height: CGFloat, color: UIColor) {
        let frame = CGRect(x: 0, y: 0, width: width, height: height)
        shapeView = UIView(frame: frame)
        shapeView.backgroundColor = color
    }
}

let square = Shape(width: 100, height: 100, color: .redColor())

square.shapeView.backgroundColor = .blueColor()

// Value types that contain reference types aren't 100% immutable types you expect them to be



// Type methods

struct Map {
    static let origin: Point = Point(x: 0, y: 0)
    
    static func distanceFromOrigin(point: Point) -> Double {
        let horizontalDistance = origin.x - point.x
        let verticalDistance = origin.y - point.y
        
        func square(value: Double) -> Double {
            return value * value
        }
        
        return sqrt(square(horizontalDistance) + square(verticalDistance))
    }
}

// Final Classes

class Calculator {
    
    class func squareRoot(value: Double) -> Double {
        return sqrt(value)
    }
    
    // Adding the keyword `final` prevents it from being overridden
    final class func square(value: Double) -> Double {
        return value * value
    }
}

class NewtonsCalculator: Calculator {
    
    // Override the class method (function)
    override class func squareRoot(value: Double) -> Double {
        var guess = 1.0
        var newGuess: Double
        
        while true {
            newGuess = (value/guess + guess)/2
            if guess == newGuess {
                return guess
            }
            
            guess = newGuess
        }
    }
}

NewtonsCalculator.squareRoot(100)


//
// Extending a Native Type
//
// * Can add computed properties
// * Cannont add stored properties or property observers
// * Can add new type and instance methods
// * can define nested types
// * Can add convenience initalizers

extension Int {
    var isOdd: Bool {
        return self % 2 != 0
    }
}

3.isOdd
8.isOdd











//: [Next](@next)
