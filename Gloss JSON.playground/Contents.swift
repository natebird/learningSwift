//: Playground - noun: a place where people can play

import UIKit
import XCPlayground

XCPlaygroundPage.currentPage.needsIndefiniteExecution = true

DataManager.getTopAppsDataFromItunesWithSuccess { (data) -> Void in
  var json: [String: AnyObject]!
  
  // 1
  do {
    json = try NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions()) as? [String: AnyObject]
  } catch {
    print(error)
    XCPlaygroundPage.currentPage.finishExecution()
  }
  
  // 2
  guard let topApps = TopApps(json: json) else {
    print("Error initializing object")
    XCPlaygroundPage.currentPage.finishExecution()
  }
  
  // 3
  guard let topApp = topApps.feed?.entries?.first else {
    print("No such item")
    XCPlaygroundPage.currentPage.finishExecution()
  }
  
  guard let topTwentyFive = topApps.feed?.entries else {
    print("No such item")
    XCPlaygroundPage.currentPage.finishExecution()
  }
  
  // 4
  print(topApp)
  
  for app in topTwentyFive {
    print(app.name)
  }
  
  XCPlaygroundPage.currentPage.finishExecution()
    
}
 