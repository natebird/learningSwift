//: Higher Order Functions
// map, reduce, filter
// Inspiration from https://www.weheartswift.com/higher-order-functions-map-filter-reduce-and-more/ and https://teamtreehouse.com

/////////
// MAP //
/////////

// The map method transforms the elements in an array using a function.

let numbers = [1,5,10,20,50,100]

let dollars = numbers.map({"$\($0)"})
dollars

let pounds = numbers.map({money in "\(money)£"})
pounds


////////////
// FILTER //
////////////

// The filter method selects the elements in an array that pass a certain condition

let smallChange = numbers.filter({$0 < 50})
smallChange




////////////
// REDUCE //
////////////

// The reduce method combine the elements in an array to a single value

let totalMoney = numbers.reduce(0, combine: {$0 + $1})
totalMoney

// same thing, just with shorthand syntax
let moneySum = numbers.reduce(0,combine: +)




