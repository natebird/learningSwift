//: Closures

// This function takes a string and prints it
func printString(aString: String) {
  print("Printing the string passed in: \(aString)")
}

printString("Hi, my name is Nate.")

/*
  Assign the function we just declared to to a
  constant. Note that we do not add parentheses
  "()" after the function name.
*/
let someFunction = printString

someFunction("Hi, look at me!")

func printInt(number: Int) {
  print("Printing the number passed in: \(number)")
}

let numberOfApples = 3

func displayString(printStringFunc: (String) -> Void) {
  printStringFunc("I'm a function inside another function")
}

displayString(printString)

let allNumber = [1,2,3,4,5,6,7,8,9,10]

func isEvenNumber(i: Int) -> Bool {
  return i % 2 == 0
}

let ifEven = isEvenNumber

let evenNumbers = allNumber.filter(ifEven)


// Capturing variables

// Returning functions
func printerFunction() -> (Int) -> () {
  var runningTotal = 0
  func printInteger(number: Int) {
    runningTotal += 10
    print("The running total is: \(runningTotal)")
  }
  return printInteger
}

let printAndReturnIntegerFunc = printerFunction()

printAndReturnIntegerFunc(2)
printAndReturnIntegerFunc(3)

let runningTotalFunction = printerFunction()
runningTotalFunction(2)

func differenceBetweenNumbers(a: Int, b:Int) -> (Int) {
  return a - b
}

// Enter your code below

func mathOperation(differenceBetweenNumbers: (Int, Int) -> Int, a: Int, b: Int) -> Int{
  return differenceBetweenNumbers(a,b)
}


//challenge 2
let difference = mathOperation(differenceBetweenNumbers, a: 4, b: 8)





