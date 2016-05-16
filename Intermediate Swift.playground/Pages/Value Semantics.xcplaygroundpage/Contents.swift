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


// START Code Challenge
extension String {
    func add(int: Int) -> Int? {
        guard let stringAsInt = Int(self) else { return nil }
        return stringAsInt + int
    }
}

"1".add(2)
"baloney".add(2)

// END Code Challenge


// Protocol Conformance Using Extensions
import GameKit

protocol  UniqueType {
    var id: Int {
        get
    }
}

extension UIView: UniqueType {
//    var id: Int {
//        return GKRandomSource.sharedRandom().nextIntWithUpperBound(1000)
//    }
    
    var id: Int {
        return 1
    }
}

extension UniqueType {
    // Provides a default implementation
    
    var id: Int {
        return GKRandomSource.sharedRandom().nextIntWithUpperBound(1000)
    }
}

let view = UIView()
view.id

// START Code Challenge 
// Your task is to extend User to conform to PrettyPrintable by adding a computed property that returns a formatted description of a User instance.

protocol PrettyPrintable {
    var prettyDescription: String { get }
}

struct User {
    let name: String
    let ID: Int
}

// My code below:
extension User: PrettyPrintable {
    var prettyDescription: String {
        return "\(name) (\(ID))"
    }
}


// END Code Challenge


protocol PersonType {
    var firstName: String { get }
    var middleName: String? { get }
    var lastName: String { get }
    
    func fullName() -> String
}

extension PersonType {
    func fullName() -> String {
        return "\(firstName) \(middleName ?? "") \(lastName)"
    }
    
    func greeting() -> String {
        return "Hi, " + fullName()
    }
}

struct Member: PersonType {
    let firstName: String
    let middleName: String?
    let lastName: String
    
    func fullName() -> String {
        return "\(lastName) \(firstName)"
    }

    func greeting() -> String {
        return "Hey there, " + fullName()
    }
}

let someMember = Member(firstName: "Nate", middleName: nil, lastName: "Bird")
let anotherMember: PersonType = Member(firstName: "Frank", middleName: nil, lastName: "Stallone")
someMember.fullName()
anotherMember.fullName()

someMember.greeting()
anotherMember.greeting()


struct Friend: PersonType {
    let firstName: String
    let middleName: String?
    let lastName: String
    
    func greeting() -> String {
        return "Hello, " + fullName()
    }
}

let someFriend = Friend(firstName: "Ben", middleName: nil, lastName: "Johnson")
let people = [someMember, anotherMember, someFriend]

for person in people {
    print(person.greeting())
}




// START Code Challenge
// Your task is to provide a default implementation for the method through a protocol extension.
protocol Math {
    func square(value: Double) -> Double
}


// Enter your code below

extension Math {
    func square(value: Double) -> Double {
        return value * value
    }
}
// END Code Challenge

protocol SomeProtocol {
    func someMethod() -> Int
}

extension SomeProtocol {
    func someMethod() -> Int {
        return 1
    }
}

struct SomeStruct: SomeProtocol {
    func someMethod() -> Int {
        return 2
    }
}

let a: SomeStruct = SomeStruct()
a.someMethod()


//: [Next](@next)
