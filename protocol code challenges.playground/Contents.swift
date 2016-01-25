protocol ColorSwitchable {
  func switchColor(color: Color)
}

enum LightState {
  case On, Off
}

enum Color {
  case RGB(Double, Double, Double, Double)
  case HSB(Double, Double, Double, Double)
}

class WifiLamp: ColorSwitchable {
  let state: LightState
  var color: Color
  
  init() {
    self.state = .On
    self.color = .RGB(0,0,0,0)
  }
  
  func switchColor(color: Color) {
    self.color = color
  }
}



///////
protocol AnimalType {
  var numberOfLegs: Int { get }
}

protocol PetType: AnimalType {
  var cuddlyName: String { get }
}

struct Dog: PetType {
  var numberOfLegs = 4
  var cuddlyName = "Puppy!"
}