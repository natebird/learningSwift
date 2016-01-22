//: Enums and Optionals

let week = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"]

func weekdayOrWeekend(day: String) -> String {
  switch day {
    case "Saturday", "Sunday": return "Weekend"
    case "Monday", "Tuesday", "Wednesday", "Thursday", "Friday": return "Weekday"
    default: return "This isn't a valid day"
  }
}

func muteNotifications(day: String) -> Bool {
  if day == "Weekend" {
    return true
  } else {
    return false
  }
}

let result = weekdayOrWeekend(week[4])
let isMuted = muteNotifications(result)

enum Day {
  case Monday
  case Tuesday
  case Wednesday
  case Thursday
  case Friday
  case Saturday
  case Sunday
}


enum DayType {
  case Weekday, Weekend
}

// Exhaustive switch statement. A default value isn't required because we use all Day values.
func weekdayOrWeekend(day: Day) -> DayType {
  switch day {
  case .Saturday, .Sunday: return .Weekend
  default: return .Weekday
  }
}

func muteNotifications(dayType: DayType) -> Bool {
  switch dayType {
  case .Weekend: return true
  case .Weekday: return false
  }
}

let dayType = weekdayOrWeekend(.Saturday)
let isWeekend = muteNotifications(dayType)


// Code challenge
enum Direction {
  case Left
  case Right
  case Up
  case Down
}