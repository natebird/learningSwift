//: Object-Oriented Swift

let x1 = 0
let y1 = 0

let coordinate1: (x: Int, y: Int) = (0,0)
coordinate1.x

struct Point {
  let x: Int
  let y: Int
  
  init(x: Int, y: Int) {
    self.x = x
    self.y = y
  }
  
  func surroundingPoints(withRange range: Int = 1) -> [Point] {
    var results: [Point] = []
    for xCoord in (x-range)...(x+range) {
      for yCoord in (y-range)...(y+range) {
        let coordinatePoint = Point(x: xCoord, y: yCoord)
        results.append(coordinatePoint)
      }
    }
    return results
  }
}

let p1 = Point(x: 0, y: 0)

p1.surroundingPoints(withRange: 2)

// Code Challenge
struct Book {
  let title: String
  let author: String
  let price: Double
}

let myBook = Book(title: "Animal Farm", author: "George Orwell", price: 6.00)


// Methods


// Code Challenge
//struct Person {
//  let firstName: String
//  let lastName: String
//  
//  func getFullName() -> String {
//    return "\(firstName) \(lastName)"
//  }
//}
//
//let nate = Person(firstName: "Nate", lastName: "Bird")
//let fullName = nate.getFullName()


// Instance Methods

//Code Challenge

struct RGBColor {
  let red: Double
  let green: Double
  let blue: Double
  let alpha: Double
  
  let description: String
  
  // Add your code below
  
  init(red: Double, green: Double, blue: Double, alpha: Double) {
    self.red = red
    self.green = green
    self.blue = blue
    self.alpha = alpha
    self.description = "red: \(red), green: \(green), blue: \(blue), alpha: \(alpha)"
  }
}


// Classes
class Enemy {
  var life: Int = 2
  let position: Point
  
  init(x: Int, y: Int) {
    self.position = Point(x: x, y: y)
  }
  
  func decreaseHealth(factor: Int) {
    life -= factor
  }
}

// Code Challenge
class Shape {
  var numberOfSides: Int
  
  init(numberOfSides: Int) {
    self.numberOfSides = numberOfSides
  }
}

let someShape = Shape(numberOfSides: 5)


class Tower {
  let position: Point
  var range: Int = 1
  var strength: Int = 1
  
  init(x: Int, y: Int) {
    self.position = Point(x: x, y: y)
  }
  
  func fireAtEnemy(enemy: Enemy) {
    if inRange(self.position, range: self.range, target: enemy.position) {
      while enemy.life > 0 {
        enemy.decreaseHealth(self.strength)
        print("Enemy hit!")
        
        if enemy.life == 0 {
          print("Enemy Vanguished")
        }
      }
    } else {
      print("The enemy is out of range!")
    }
  }
  
  func inRange(position: Point, range: Int, target: Point) -> Bool {
    let availablePositions = position.surroundingPoints(withRange: range)
    
    for point in availablePositions {
      if (point.x == target.x) && (point.y == target.y) {
        // Immediately exits for loop
        return true
      }
    }
    return false
  }
}

class SuperEnemy: Enemy {
  let isSuper: Bool = true
  
  override init(x: Int, y: Int) {
    super.init(x: x, y: y)
    self.life = 10
  }
}

class LaserTower: Tower {
  
  override init(x: Int, y: Int) {
    super.init(x: x, y: y)
    self.strength = 100
    self.range = 100
  }
  
  override func fireAtEnemy(enemy: Enemy) {
    while enemy.life > 0 {
      enemy.decreaseHealth(self.strength)
      print("Enemy hit!")
    }
    print("Enemy Vanguished")
  }
}


let tower = Tower(x: 0, y: 0)
let enemy = Enemy(x: 1, y: 1)
let superEnemy = SuperEnemy(x: 2, y: 2)
superEnemy.life

tower.fireAtEnemy(enemy)



// Code Challenge
struct Location {
  let latitude: Double
  let longitude: Double
}

class Business {
  let name: String
  let location: Location
  
  init(name: String, latitude: Double, longitude: Double) {
    self.name = name
    self.location = Location(latitude: latitude, longitude: longitude)
  }
}

let someBusiness = Business(name: "Pringles", latitude: 12.3, longitude: 34.5)

// Inheritance

// Code Challenge

class Vehicle {
  var numberOfDoors: Int
  var numberOfWheels: Int
  
  init(withDoors doors: Int, andWheels wheels: Int) {
    self.numberOfDoors = doors
    self.numberOfWheels = wheels
  }
}

// Enter your code below

class Car: Vehicle {
  let numberOfSeats: Int = 4
  
  override init(withDoors doors: Int, andWheels wheels: Int) {
    super.init(withDoors: doors, andWheels: wheels)
  }
}

let someCar = Car(withDoors: 4, andWheels: 4)


///////
class Person {
  let firstName: String
  let lastName: String
  
  init(firstName: String, lastName: String) {
    self.firstName = firstName
    self.lastName = lastName
  }
  
  func getFullName() -> String {
    return "\(firstName) \(lastName)"
  }
}

class Doctor: Person {
  override init(firstName: String, lastName: String) {
    super.init(firstName: firstName, lastName: lastName)
  }
  
  override func getFullName() -> String {
    return "Dr. \(lastName)"
  }
}

let someDoctor = Doctor(firstName: "Kelly", lastName: "Slater")
someDoctor.getFullName()


