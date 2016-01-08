//: Logical operators

// &&

let a = 3 > 2
let b = 4 > 5

a && b

let temperature = 10

if temperature > 7 && temperature < 12 {
  print("Might want to wear a coat.")
}


// ||

var isRaining = true
var isSnowing = false

if isRaining || isSnowing {
  print("You should wear boots")
}

if !isRaining || !isSnowing {
  print("Yay! The sun is out")
}

if (isRaining || isSnowing) && temperature < 12 {
  print("Put some gloves on")
}

// Quiz

var results: [Int] = []

for n in 1...100 {
  // Enter your code below
  if (n % 7 == 0) && (n % 2 != 0) {
    results += [n]
  }
  // End code
}
results


// Switch statements

let airportCodes = [
  "LGA",
  "LHR",
  "CDG",
  "HKG",
  "DXB",
  "SLC",
  "ATL"
]


let airport = airportCodes[0]

for airportCode in airportCodes {
  switch airportCode {
  case "LGA": print("New York")
  case "ATL": print("Atlanta")
  case "SLC": print("Salt Lake City")
  default: print("I don't know which city this airport is located!")
  }
}

import Foundation

var randomTemperature = Int(arc4random_uniform(UInt32(150)))

switch randomTemperature {
  case 0..<32: print("It's freezing!")
  case 32...45: print("It's quite cold. You'll need a jacket.")
  case 45..<70: print("It's a bit chilly. I reccomment wearing a light sweater.")
  case 71...100: print("It's hot. T-shirt weather!")
  default: print("I don't know what is happening")
}



// Quiz 2
var europeanCapitals: [String] = []
var asianCapitals: [String] = []
var otherCapitals: [String] = []

let world = [
  "BEL": "Brussels",
  "LIE": "Vaduz",
  "BGR": "Sofia",
  "USA": "Washington D.C.",
  "MEX": "Mexico City",
  "BRA": "Brasilia",
  "IND": "New Delhi",
  "VNM": "Hanoi"]

for (key, value) in world {
  // Enter your code below
  switch key {
    case "BEL","LIE","BGR": europeanCapitals.append(value)
    case "IND", "VNM": asianCapitals.append(value)
    case "USA", "MEX", "BRA": otherCapitals.append(value)
    default: print("ahhh!")
  }
  // End code
}


// FizzBuzz

//divisible by 3 Fizz
//divisible by 5 Buzz
//divisible by both 3 or 5 FizzBuzz

for n in numbers {
  if (n % 3 == 0) && (n % 5 == 0) {
    print("FizzBuzz")
  } else if n % 3 == 0 {
    print("Fizz")
  } else if n % 5 == 0 {
    print("Buzz")
  } else {
    print("\(n)")
  }
  
}




