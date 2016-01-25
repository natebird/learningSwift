//: Protocols

// A "Can Do" protocol
// "-able suffix"

// A "Is A" protocol
// "-type sufix"

// A "Can Be" protocol
// "-Convertible suffix"

protocol FullyNameable {
  var fullName: String { get }
}

struct User: FullyNameable {
  var fullName: String
}

let user = User(fullName: "Nate Bird")
user.fullName


struct Friend {
  var firstName: String
  var middleName: String
  var lastName: String
  
  var fullName: String {
    return "\(firstName) \(middleName) \(lastName)"
  }
}

let friend = Friend(firstName: "Taylor", middleName: "Jedediah", lastName: "Dawson")

friend.fullName


// Inheritance vs Protocols

import Foundation

protocol Payable {
  func pay() -> (basePay: Double, benefits: Double, deductions: Double, vacationTime: Double)
}

class Employee {
  let name: String
  let address: String
  let startDate: NSDate
  let type: String
  
  var departments: String?
  var reportsTo: Employee?
  
  init(fullName: String, employeeAddress: String, employeeStartDate: NSDate, employeeType: String) {
    name = fullName
    address = employeeAddress
    startDate = employeeStartDate
    type = employeeType
  }
}

class HourlyEmployee: Employee, Payable {
  let hourlyWage = 12.0
  let hoursWorked = 40.0
  let availableVaction = 0.0
  
  func pay() -> (basePay: Double, benefits: Double, deductions: Double, vacationTime: Double) {
    return (hourlyWage * hoursWorked, 0.0, 0.0, availableVaction)
  }
}

class SalaryEmployee: Employee {
  let salary = 40000
}



// Modeling Loose Relationships

protocol Blendable {
  func blend()
}

class Fruit: Blendable {
  var name: String
  
  init(name: String) {
    self.name = name
  }
  
  func blend() {
    print("I love smoothies!")
  }
}

class Dairy {
  var name: String
  
  init(name: String) {
    self.name = name
  }
}

class Cheese: Dairy {

}

class Milk: Dairy, Blendable {
  func blend() {
    print("I haven't changed, I'm still Milk!")
  }
}

func makeSmoothie(ingredients: [Blendable]) {
  for ingredient in ingredients {
    ingredient.blend()
  }
  print("Smoothie time!")
}


let strawberry = Fruit(name: "Strawberry")
let cheddar = Cheese(name: "Cheddar Cheese")
let chocolateMilk = Milk(name: "Chocolate Milk")

let ingredients: [Blendable] = [strawberry, chocolateMilk]
makeSmoothie(ingredients)


// Random Number Generator

protocol RandomNumberGenerator {
  func random() -> Double
}

class LinearCongruentialGenerator: RandomNumberGenerator {

  var lastRandom = 42.0
  let m = 139968.0
  let a = 3877.0
  let c = 29573.0
  
  func random() -> Double {
    lastRandom = ((lastRandom * a + c) % m)
    return lastRandom / m
  }
}

class Dice {
  let sides: Int
  let generator: RandomNumberGenerator
  
  init(sides: Int, generator: RandomNumberGenerator) {
    self.sides = sides
    self.generator = generator
  }
  
  func roll() -> Int {
    return Int(generator.random() * Double(sides)) + 1
  }
}

var d6 = Dice(sides: 6, generator: LinearCongruentialGenerator())


///////////////////

protocol Printable {
  func description() -> String
}

protocol PrettyPrintable: Printable {
  func prettyDescription() -> String
}

struct User2: PrettyPrintable {
  let name: String
  let age: Int
  let address: String
  
  func description() -> String {
    return "\(name), \(age), \(address)"
  }
  
  func prettyDescription() -> String {
    return "name: \(name), age: \(age), age: \(address)"
  }

}

let nate = User2(name: "Nate", age: 35, address: "30114")
nate.description()
nate.prettyDescription()








