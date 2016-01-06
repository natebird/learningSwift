//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

func square(x:Int) -> Int {
  return x * x
}

func sumOfSquares(x:Int,y:Int) -> Int {
  
  return square(x) + square(y)
}

sumOfSquares(2, y: 3)


// Using the filter function
let allNumbers = [1,2,3,4,5,6,7,8,9,10]

func isEvenNumber(i: Int) -> Bool {
  return i % 2 == 0
}

let ifEven = isEvenNumber

let evenNumbers = allNumbers.filter(ifEven)
