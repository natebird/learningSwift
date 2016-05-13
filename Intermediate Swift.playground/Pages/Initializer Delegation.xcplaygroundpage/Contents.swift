import UIKit

// Value Types
struct Point {
    var x: Int = 0
    var y: Int = 0
}

struct Size {
    var width: Int = 0
    var height: Int = 0
}

struct Rectangle {
    var origin = Point()
    var size = Size()
    
    init(origin: Point, size: Size) {
        self.origin = origin
        self.size = size
    }
    
    init(x: Int, y: Int, height: Int, width: Int) {
        let origin = Point(x: x, y: y)
        let size = Size(width: width, height: height)
        
        self.init(origin: origin, size: size)
    }
    
    init(center: Point, size: Size) {
        let originX = center.x - size.width/2
        let originY = center.y - size.height/2
        let origin = Point(x: originX, y: originY)
        
        self.init(origin: origin, size: size)
    }
}


// Reference Types

// Designated Initializers
// * Central point of initialization
// * Classes must have at least one
// * Responsible for initializing stored properties
// * Responsible for calling super init

class Vehicle {
    var name: String
    
    // Designated initializer
    init(name: String) {
        self.name = name
    }
    
    //    Convenience initializer
    //    Can only call a designated initializer within the same class
    convenience init() {
        self.init(name: "Unnamed")
    }
}

class Car: Vehicle {
    let numberOfDoors: Int
    
    init(name: String, numberOfDoors: Int) {
        self.numberOfDoors = numberOfDoors
        super.init(name: name)
    }
    
    convenience override init(name: String) {
        self.init(name: name, numberOfDoors: 4)
    }
    
    convenience init() {
        self.init(name: "Unnamed")
    }

}

// Required initialization
class SomeClass {
    required init() {
        
    }
}

class AnotherClass: SomeClass {
    init(test: String) {
        
    }
    
    required init() {
        fatalError("init() has not been implemented")
    }
}






