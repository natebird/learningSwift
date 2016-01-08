//: Functions

// A sequence of instructions that perform a 
// very specific task packaged up as a unit.

// Room #1
let length = 10
let width = 12
let area = length * width

// Room #2
let secondLength = 14
let secondWidth = 8
let secondArea = secondLength * secondWidth

func calculateArea(length: Int, width: Int) -> Int {
  return length * width
}

let roomOneArea = calculateArea(10, width: 12)
let roomTwoArea = calculateArea(14, width: 8)

// Code challenge
func temperatureInFahrenheit(temperature: Double) -> Double {
  return temperature * 9 / 5 + 32
}

let fahrenheitTemp = temperatureInFahrenheit(24.0)


// Named parameters
func concatenateStrings(a: String, b: String) -> String {
  return a + b
}

concatenateStrings("A", b: "B")

func sayHello(to person: String, and anotherPerson: String) -> String {
  return "Hello \(person) and \(anotherPerson)"
}

sayHello(to: "Nate", and: "Tiffany")
sayHello(to: "Adam", and: "Yvette")

// Challenge
func getRemainder(value a: Int, divisor b: Int) -> Int {
  return a % b
}
let result = getRemainder(value: 10, divisor: 3)


// Default Values

func carpetCostCalculator(length lenth: Int, width: Int, carpetColor: String = "tan") -> (price: Int, carpetColor: String) {
  //   gray carpet - $1/sq ft
  //  Tan carpet - $2/sq ft
  //  Deep blue carpet - $4/sq ft
  
  let area = calculateArea(length, width: width)
  var price: Int
  
  switch carpetColor {
    case "gray": price = area * 1
    case "tan": price = area * 2
    case "blue": price = area * 4
    default: price = 0
  }
  return (price, carpetColor)
  
}

let output = carpetCostCalculator(length: 10, width: 12)
carpetCostCalculator(length: 14, width: 8, carpetColor: "blue")


// Returning complex values

output.price
output.carpetColor


// Function scope

func countDownAndUp(var a: Int) {
  var b = a
  
  while b >= 0 {
    b -= 1
    a += 1
    print("a: \(a)")
    print("b: \(b)")
  }
}

var a = 20
countDownAndUp(10)



// Challenge
//
//Eiffel Tower - lat: 48.8582, lon: 2.2945
//Great Pyramid - lat: 29.9792, lon: 31.1344
//Sydney Opera House - lat: 33.8587, lon: 151.2140

func getTowerCoordinates(location: String) -> (lat: Double, lon: Double) {
  var lat: Double
  var lon: Double
  
  switch location {
  case "Eiffel Tower": (lat = 48.8582, lon = 2.2945)
  case "Great Pyramid": (lat = 29.9792, lon = 31.1344)
  case "Sydney Opera House": (lat = 33.8587, lon = 151.2140)
  default: (lat = 0.0, lon = 0.0)
  }
  return (lat, lon)
}

getTowerCoordinates("Eiffel Tower")
getTowerCoordinates("Great Pyramid")
getTowerCoordinates("Sydney Opera House")














