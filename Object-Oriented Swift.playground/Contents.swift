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
struct Person {
  let firstName: String
  let lastName: String
  
  func getFullName() -> String {
    return "\(firstName) \(lastName)"
  }
}

let nate = Person(firstName: "Nate", lastName: "Bird")
let fullName = nate.getFullName()


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





