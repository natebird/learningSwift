//: Enums with Raw Values

enum Coin: Double {
  case Penny = 0.01
  case Nickel = 0.05
  case Dime = 0.10
  case Quarter = 0.25
}

let coins: [Coin] = [.Penny, .Nickel, .Dime, .Dime, .Quarter, .Quarter, .Quarter]


// Pattern Matching with Enums
var count: Int = 0

for case Coin.Quarter in coins {
  count += 1
}

for coin in coins {
  if case Coin.Nickel = coin {
    print("Not worth much")
  } else if case Coin.Dime = coin {
    print("Barely worth keeping")
  }
}

let someOptional: Int? = 42

// Behind the scenes
if case .Some(let x) = someOptional {
  print(x)
}


func totalValue(coins: [Coin]) -> Double {
  var total: Double = 0
  for coin in coins {
    total += coin.rawValue
  }
  return total
}

totalValue(coins)

enum HTTPMethod: String {
  case GET, POST, PUT, DELETE
}

HTTPMethod.GET.rawValue

enum HTTPStatusCodes: Int {
  case Continue = 100
  case Success = 200
  case Unauthorized = 401
  case Forbidden = 403
  case NotFound = 404
}

let statusCode = 200
if let httpCode = HTTPStatusCodes(rawValue: statusCode) {
  print(httpCode)
}


// Optional Chaining
class Address {
  var streetName: String?
  var buildingNumber: String?
  var apartmentNumber: String?
}

class Residence {
  var address: Address?
}

class Person {
  var residence: Residence?
}

let susan = Person()

let address = Address()
address.streetName = "1234 Main Street"
address.buildingNumber = "Building 10"
address.apartmentNumber = "204"

let residence = Residence()
residence.address = address

susan.residence = residence

let apartmentNumber = susan.residence?.address?.apartmentNumber

// Nil Coalescing Operator

let firstName: String? = "Nate"
let username = "Xorel"

var displayName: String

if firstName != nil {
  displayName = firstName!
} else {
  displayName = username
}

// question ? answer1 : answer2
displayName = firstName != nil ? firstName! : username

displayName = firstName ?? username


// code challenge

enum Compass: Int {
  case North
  case South
  case East
  case West
}

let direction = Compass(rawValue: 1)
