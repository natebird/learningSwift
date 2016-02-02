//: String to Float
import Foundation

let str = "15.8,15.3,14.9,14.6,14.3,14.0,13.7"
let floats = str.componentsSeparatedByString(",").flatMap { Float($0) }
floats
