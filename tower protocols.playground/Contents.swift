struct Point {
  let x: Int
  let y: Int
  
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


class Enemy {
  var life: Int = 2
  let position: Point
  
  init(position: Point) {
    self.position = position
  }
  
  func decreaseHealth(factor: Int) {
    life -= factor
  }
}

class Tower {
  let position: Point
  var range: Int = 1
  var strength: Int = 1
  
  init(position: Point) {
    self.position = position
  }
  
  func fireAtEnemy(enemy: Enemy) {
    if inRange(self.position, range: self.range, target: enemy.position) {
      while enemy.life >= 0 {
        enemy.decreaseHealth(strength)
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