//: Playground - noun: a place where people can play

import Foundation
import XCPlayground
func httpGet(request: NSURLRequest!, callback: (String, String?) -> Void) {
  let session = NSURLSession.sharedSession()
  let task = session.dataTaskWithRequest(request){
    (data, response, error) -> Void in
    if error != nil {
      callback("", error!.localizedDescription)
    } else {
      let result = NSString(data: data!, encoding:
        NSASCIIStringEncoding)!
      callback(result as String, nil)
    }
  }
  task.resume()
}

let url = "http://google.com"
var request = NSMutableURLRequest(URL: NSURL(string: url)!)
httpGet(request){
  (data, error) -> Void in
  if error != nil {
    print(error)
  } else {
    print(data)
  }
}

XCPlaygroundPage.currentPage.needsIndefiniteExecution = true
