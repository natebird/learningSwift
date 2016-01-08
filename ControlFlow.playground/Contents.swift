//: Control Flow

var todo = [
  "Finish Collections Course",
  "Buy groceries",
  "Watch Sherlock",
  "Order stuff from Amazon",
  "Mow the lawn"
]

print(todo[2])


/////////////////
// For In Loop //
/////////////////

for task in todo {
  print(task)
}

for number in 1...12 {
  print(number * 5)
}


// Quiz
var results: [Int] = []

for number in 1...10 {
  let multiplier = 6
  let value = number * multiplier
  
  results.append(value)
}

results


////////////////
// While Loop //
////////////////

var index = 0

while index < todo.count {
  print(todo[index])
  index += 1
}

///////////////////////
// Repeat While Loop //
///////////////////////

var counter = 1

while counter < 1 {
  print("I'm inside the while loop")
  counter += 1
}

repeat {
  print("I'm inside the repeat loop")
  counter += 1
} while counter < 1

// Quiz 2
let numbers = [2,8,1,16,4,3,9]
var sum = 0
var quizCounter = 0

while quizCounter < numbers.count {
  sum += numbers[quizCounter]
  quizCounter += 1
}
sum








