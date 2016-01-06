//: Implementing Ruby's memoization operator in Swift
// From: https://airspeedvelocity.net/2014/06/10/implementing-rubys-operator-in-swift/


// define operator properties
infix operator ||= {
  associativity right
  precedence 90
  assignment
}

// define the operator function
// Using generic to apply to all types
func ||=<T>(inout lhs: T?, @autoclosure rhs: () -> T) {
  if(lhs == nil) {
    lhs = rhs()
  }
}

// This was in the post to address something with boolean values
// but it seems to work regardless
//func ||=<T: BooleanType>(inout lhs: T, @autoclosure rhs: () -> T) {
//  if(!lhs) {
//    lhs = rhs()
//  }
//}

var s: String?
s ||= "First assignment"
s ||= "Second assignment"
assert(s == "First assignment")

var n: Int?
n ||= 5
n ||= 6
assert(n == 5)

var t: Bool?
t ||= true
t ||= false
assert(t == true)
