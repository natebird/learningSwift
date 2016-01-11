//: Structs vs Classes

struct User {
  var fullName: String
  var email: String
  var age: Int
}

var someUser = User(fullName: "Nate", email: "natebird@gmail.com", age: 35)
var anotherUser = someUser

someUser.email
anotherUser.email

someUser.email = "etandrib@gmail.com"
someUser.email
anotherUser.email


class Person {
  var fullName: String
  var email: String
  var age: Int
  
  init(name: String, email: String, age: Int) {
    self.fullName = name
    self.email = email
    self.age = age
  }
}

var somePerson = Person(name: "Tim Cook", email: "tim.cook@apple.com", age: 54)
var anotherPerson = somePerson

somePerson.email = "tcook@apple.com"
somePerson.email
anotherPerson.email