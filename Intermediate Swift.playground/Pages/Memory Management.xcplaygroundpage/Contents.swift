//: [Previous](@previous)

// Manual Retain Release
// iOS 5 introduced ARC (Automatic Reference Counting)


class Food {
    let name: String
    
    init(name: String) {
        self.name = name
        print("Memory allocated for \(name)")
    }
    
    deinit {
        print("\(name) is being deinitialized. Memory deallocated")
    }
}

var reference1: Food? = Food(name: "Hot Dog")

var reference2: Food? = reference1

reference1 = nil
reference2 = nil


// Memory Leaks
class Person {
    let name: String
    
    init(name: String) {
        self.name = name
    }
    
    // var apartment: Apartment?
    weak var apartment: Apartment?
    
    deinit {
        print("\(name) is being deinitialized. Memory deallocated")
    }
}

class Apartment {
    let unit: String
    
    init(unit: String) {
        self.unit = unit
    }
    
    // var tenant: Person?
    weak var tenant: Person?
    
    deinit {
        print("Apartment \(unit) is being deinitialized. Memory deallocated")
    }
    
}

var person: Person? = Person(name: "Nate")
var apartment: Apartment? = Apartment(unit: "3B")

person?.apartment = apartment
apartment?.tenant = person

person = nil
apartment = nil


//: [Next](@next)
