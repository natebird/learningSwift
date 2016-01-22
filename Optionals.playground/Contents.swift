//: Optionals

struct Person {
  let firstName: String
  let middleName: String?
  let lastName: String
  
  func getFullName() -> String {
    return "\(firstName) \(middleName) \(lastName)"
  }
}

let me = Person(firstName: "Nate", middleName: nil, lastName: "Bird")
me.middleName
me.firstName
me.lastName

// Optionals under the hood
enum Optional<T> {
  case Some(T)
  case None
}

me.getFullName()

// If Let syntax
let airportCodes = ["ATL": "Atlanta Airport"]
if let newYorkAirport = airportCodes["JFK"] {
  print(newYorkAirport)
} else {
  print("That key does not exist")
}

let weatherDictionary: [String: [String : String]] =
  ["currently": ["temperature": "22.3"],
   "daily": ["temperature": "22.3"],
   "weekly": ["temperature": "22.3"]]

if let dailyWeather = weatherDictionary["daily"],
 let highTemperature = dailyWeather["temperature"] {
  print(highTemperature)
}

struct Friend {
  let name: String
  let age: String
  let address: String?
}

// Option IF LET syntax
func createFriendOne(dict: [String: String]) -> Friend? {
  if let name = dict["name"], let age = dict["age"], let address = dict["address"] {
    return Friend(name: name, age: age, address: address)
  } else {
    return nil
  }
}

// Force unwrapping with bang (!) operator
func createFriendTwo(dict: [String: String]) -> Friend? {
  let name = dict["name"]
  if name == nil {
    return nil
  }
  let age = dict["age"]
  if age == nil {
    return nil
  }
  
  let address = dict["address"]
  return Friend(name: name!, age: age!, address: address)
}

// only check for required values
func createFriendThree(dict: [String: String]) -> Friend? {
  if let name = dict["name"], let age = dict["age"] {
   let address = dict["address"]
    return Friend(name: name, age: age, address: address)
  } else {
    return nil
  }
}

// The better way - guard
func createFriend(dict: [String: String]) -> Friend? {
  guard let name = dict["name"] else { return nil }
  guard let age = dict["age"] else { return nil }
  let address = dict["address"]
  
  return Friend(name: name, age: age, address: address)
}


// Code challenges
var someValue: Int?

someValue = nil

let movieDictionary = ["Spectre": ["cast": ["Daniel Craig", "Christoph Waltz", "Léa Seydoux", "Ralph Fiennes", "Monica Bellucci", "Naomie Harris"]]]

var leadActor: String = ""


if let movie = movieDictionary["Spectre"], let cast = movie["cast"] {
  leadActor = cast[0]
}

struct Book {
  let title: String
  let author: String
  let price: String?
  let pubDate: String?
  
  init?(dict: [String: String]) {
    guard let title = dict["title"], let author = dict["author"] else { return nil }
    
    self.title = title
    self.author = author
    self.price = dict["price"]
    self.pubDate = dict["publish_date"]
  }
}



