
// Tips for using protocols
// Encapsulate common behavior
// Is-A (inheritace) vs Has-A (protocol) relationship
// Protocols as types
// Protocol inheritance to build up complex protocols

struct Point {
  var x: Int
  var y: Int
  
  func pointsAroundMe(withRange range: Int) -> [Point] {
    var results: [Point] = []
    
    for x in (self.x - range)...(self.x + range) {
      for y in (self.y - 1)...(self.y + 1) {
        let point = Point(x: x, y: y)
        results.append(point)
      }
    }
    
    return results
  }
}

enum Direction {
  case Up, Down, Left, Right
}

protocol Movable {
  func move(direction: Direction, distance: Int)
}

protocol Destructable {
  func decreaseLife(factor: Int)
}

protocol Attackable {
  var strength: Int { get }
  var range: Int { get }
  
  func attack(player: PlayerType)
}

protocol PlayerType {
  var position: Point { get set }
  var life: Int { get set }
  init(point: Point)
}

class Enemy: PlayerType, Destructable, Attackable, Movable {
  var position: Point
  var life: Int = 10
  var strength: Int = 5
  var range: Int = 2
  
  required init(point: Point) {
    self.position = point
  }
  
  func decreaseLife(factor: Int) {
    self.life -= factor
  }
  
  func attack(var player: PlayerType) {
    player.life = player.life - strength
  }
  
  func move(direction: Direction, distance: Int) {
    switch direction {
    case .Up: position.y += 1
    case .Down: position.y -= 1
    case .Left: position.x -= 1
    case .Right: position.x += 1
    }
  }
}

class Tower: PlayerType, Destructable, Attackable {
  var position: Point
  var life: Int = 10
  var strength: Int = 1
  var range: Int = 1
  
  required init(point: Point) {
    self.position = point
  }
  
  func decreaseLife(factor: Int) {
    self.life -= factor
  }

  func attack(player: Enemy) {
    if inRange(self.position, range: self.range, target: player.position) {
      while player.life >= 0 {
        player.decreaseLife(strength)
      }
      print("Enemy vanquished!")
    } else {
      print("Darn! Out of range!")
    }
  }
  
  func inRange(position: Point, range: Int, target: Point) -> Bool {
    let availablePositions = position.pointsAroundMe(withRange: range)
    for point in availablePositions {
      if point.x == target.x && point.y == target.y {
        return true
      }
    }
    return false
  }
}