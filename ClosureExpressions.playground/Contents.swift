//: Closure Expressions

func doubler(i: Int) -> Int {
  return i * 2
}

let doublerFunction = doubler

doublerFunction(4)

let numbers = [1,2,3,4,5]
let doubledNumbers = numbers.map(doublerFunction)


// Using closure expressions with the map function
let tripledNumbers = numbers.map({(i: Int) -> Int in return i * 3})

// Using closure expressions with the sorted function
var names = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]

func backwards(s1: String, s2: String) -> Bool {
  return s1 > s2
}

names.sort(backwards)

let sortedNames = names.sort({(s1: String, s2: String) -> Bool in return s1 > s2})
sortedNames


// Closure shorthand syntax

// Rule #1
[1,2,3,4,5].map({ (i:Int) -> Int in return i * 3})

// Rule #2: Inferring type from context
[1,2,3,4,5].map({i in return i * 3})

// Rule #3: Implicit returns from single expression
[1,2,3,4,5].map({i in i * 3})

// Rule #4: Shorthand argument names
[1,2,3,4,5].map({$0 * 3})

// Rule #5: Trailing closures
[1,2,3,4,5].map() {$0 * 3}

// Rule #6: Ignore parentheses
[1,2,3,4,5].map {$0 * 3}




let arrayOfNumbers = [Int](0...50)

// Enter your code below

func isOdd(i: Int) -> Bool {
  return i % 2 != 0
}

let oddNumbers = arrayOfNumbers.filter(isOdd)
oddNumbers.count





