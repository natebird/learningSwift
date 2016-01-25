//: Error Handling

// Domain errors
// Swift returns a nil value and doesn't stop the app
Int.init("1") // handles a number as a string
Int.init("one") // is a domain error and returns nil


// Runtime errors
// Recoverable errors

struct Friend {
  let name: String
  let age: String
  let address: String?
}

enum FriendError: ErrorType {
  case InvalidData(String)
}

func createFriendFromJSON(dict: [String : String]) throws -> Friend {
  
  guard let name = dict["name"] else { throw FriendError.InvalidData("Name key fails") }
  guard let age  = dict["age"]  else { throw FriendError.InvalidData("Age key fails") }
  
  let address = dict["address"]
  
  return Friend(name: name, age: age, address: address)
}

func sendMessageToFriend(friend: FriendError, message: String) {}

let response = ["name": "Nate", "age": "27", "address": "123 Main St."]

do {
  let friend = try createFriendFromJSON(response)
  //sendMessageToFriend(friend, message: "")
} catch FriendError.InvalidData(let key) {
  print(key)
}

// Defer
//func processFile(filename: String) throws {
//  if exists(filename) {
//    let file = open(filename)
//    
//    defer {
//      close(file)
//    }
//    
//    while let line = try file.readLine() {
//      // do stuff
//    }
//  }
//}


// Automatic Propagation of errors in Cocoa frameworks


// Code Challenges

// Challenge 1
enum BookError: ErrorType {
  case IncorrectTitle
}

func lend() throws {
  guard let _: String? = "Remote" else { throw BookError.IncorrectTitle }
}


// Code challenge 2
enum ParserError: ErrorType {
  case EmptyDictionary
  case InvalidKey
}

struct Parser {
  var data: [String : String?]?
  
  func parse() throws {
    guard (data != nil) else { throw ParserError.EmptyDictionary }
    guard (data?.keys.contains("someKey") == true) else { throw ParserError.InvalidKey }
  }
}

let data: [String : String?]? = ["someKey": nil]
let parser = Parser(data: data)

do {
  try parser.parse()
} catch {
  print(ParserError.InvalidKey)
}


// Unrecoverable errors
