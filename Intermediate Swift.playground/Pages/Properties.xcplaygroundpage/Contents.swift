//: Playground - noun: a place where people can play

import UIKit

struct Account {
    let username: String
    let password: String
}

let someAccount = Account(username: "me", password: "fakepassword")

struct Point {
    var x = 0
    var y = 0
}

// Type properties
struct Map {
    static let origin: Point = Point()
}

Map.origin

// Challenge 1
struct LevelTracker {
    static let maxLevel: Int = 5
}


// Computed properties
//struct Rectangle {
//    var length: Int
//    var width: Int
//    
//    // must use var
//    var area: Int {
//        return length * width
//    }
//}
//
//let r1 = Rectangle(length: 5, width: 12)
//r1.area

struct Size {
    var width = 0
    var height = 0
}

struct Rectangle {
    var origin = Point()
    var size = Size()
    
    var center: Point {
        get {
            let centerX = origin.x + size.width/2
            let centerY = origin.y + size.height/2
            
            return Point(x: centerX, y: centerY)
        }
        
        set(centerValue) {
            origin.x = centerValue.x - size.width/2
            origin.y = centerValue.y - size.height/2
        }
    }
}

var rectangle = Rectangle()
print(rectangle.center)
rectangle.center = Point(x: 10, y: 5)
print(rectangle.center)

// START - Code Challenge 2
let UIFontTextStyleHeadline = "UIFontTextStyleHeadline"
let UIFontTextStyleBody = "UIFontTextStyleBody"
let UIFontTextStyleFootnote = "UIFontTextStyleFootnote"

enum Text {
    case Headline
    case Body
    case Footnote
    
    var style: String {
        switch self {
        case .Headline: return UIFontTextStyleHeadline
        case .Body: return UIFontTextStyleBody
        case .Footnote: return UIFontTextStyleFootnote
        }
    }
}

Text.Headline.style

// END - Code Challenge 2

enum ReadingMode {
    case Day
    case Evening
    case Night
    
    var statusBarStyle: UIStatusBarStyle {
        switch self {
        case .Day, .Evening: return .Default
        case .Night: return .LightContent
        }
    }
    
    var headlineColor: UIColor {
        switch self {
        case Night: return UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        case .Evening, .Day: return UIColor(red: 16/255.0, green: 16/255.0, blue: 16/255.0, alpha: 1.0)
        }
    }
    
    var dateColor: UIColor {
        switch self {
        case .Day, .Evening: return UIColor(red: 132/255.0, green: 132/255.0, blue: 132/255.0, alpha: 1.0)
        case .Night: return UIColor(red: 151/255.0, green: 151/255.0, blue: 151/255.0, alpha: 1.0)
        }
    }
    
    var bodyTextColor: UIColor {
        switch self {
        case .Day, .Evening: return UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        case .Night: return UIColor(red: 151/255.0, green: 151/255.0, blue: 151/255.0, alpha: 1.0)
        }
    }
    
    var linkColor: UIColor {
        switch self {
        case .Day, .Evening: return UIColor(red: 68/255.0, green: 133/255.0, blue: 164/255.0, alpha: 1.0)
        case .Night: return UIColor(red: 129/255.0, green: 161/255.0, blue: 166/255.0, alpha: 1.0)
        }
    }
}

let titleLabel = UILabel()

func readingViewWithMode(readingMode: ReadingMode) {
    titleLabel.textColor = readingMode.headlineColor
}

// Lazy stored properties
// A good exampe of this is session management or a dateFormatter

class ReadItLaterClient {
    lazy var session: NSURLSession = NSURLSession(configuration: NSURLSessionConfiguration.defaultSessionConfiguration())
    
    // Do the rest of the work
}


// Property Observers
// See the property observers demo project

// START - Observer Code Challenge

// Doesn't compile
//class TemperatureController: UIViewController {
//    var temperature: Double {
//        didSet {
//            if temperature > 80 {
//                view.backgroundColor = UIColor.redColor()
//            } else if temperature < 40 {
//                view.backgroundColor = UIColor.blueColor()
//            } else {
//                view.backgroundColor = UIColor.greenColor()
//            }
//        }
//    }
//    
//    init(temperature: Double) {
//        self.temperature = temperature
//        super.init()
//    }
//    
//    override func viewDidLoad() {
//        view.backgroundColor = UIColor.whiteColor()
//    }
//}

// END - Observer Code Challenge


// Failable and Throwing Initializers

class Person {
    let name: String
    let age: Int
    
    init?(dict: [String: AnyObject]) throws {
        guard let name = dict["name"] as? String,
              let age = dict["age"] as? Int
            else { throw PersonError.InvalidData }
        
        self.name = name
        self.age = age
    }
}

enum PersonError: ErrorType {
    case InvalidData
}
