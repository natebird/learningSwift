//: Collections

////////////
// Arrays //
////////////

var todo = ["Finish Collections Course", "Buy groceries", "Watch Sherlock"]
todo.count
todo.append("Pick up dry cleaning")
todo.count
todo += ["eat dinner"]
todo.prefix(3)
todo.suffix(3)
todo.count

let firstTask = todo[0]
let thirdTask = todo[3]

todo[4] = "Clean the garage"
todo

todo.insert("Pick up kids", atIndex: 5)
todo.count

todo.removeAtIndex(5)
todo.count


var numbers = [1,2,3,4,5]
numbers.count

var arrayOfInts = [1,2,3,4,5,6]

let otherArray = arrayOfInts.append(7)

arrayOfInts = arrayOfInts + [8]

//////////////////
// Dictionaries //
//////////////////

/*
Airport Code            Airport Name
(Key)                   (Value)

LGA                     La Guardia
LHR                     Heathrow
CDG                     Charles De Gaulle
HKG                     Hong Kong International
DXB                     Dubai International
*/

var airportCodes: [String: String] = [
  "LGA": "La Guardia",
  "LHR": "Heathrow",
  "CDG": "Charles De Gaulle",
  "HKG": "Hong Kong International",
  "DXB": "Dubai International",
  "SLC": "Salt Lake City",
  "ATL": "Hartsfeld/Jackson International"
]

// Order is NOT maintained in dictionaries

// Read from a dictionary

airportCodes["ATL"]

// Inserting Key Value Pairs

airportCodes["SYD"] = "Sydney Airport"

airportCodes["LGA"] = "La Guardia International Airport"

airportCodes.updateValue("Dublin Airport", forKey: "DUB")

airportCodes["HKG"] = nil
airportCodes.removeValueForKey("SLC")


let orlandoAirport = airportCodes["MCO"]









