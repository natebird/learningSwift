import Foundation

class NetworkOperation {
  
  lazy var config: NSURLSessionConfiguration = NSURLSessionConfiguration.defaultSessionConfiguration()
  lazy var session: NSURLSession = NSURLSession(configuration: self.config)
  let queryURL: NSURL
  
  typealias JSONDictionaryCompletion = ([NSString: AnyObject]?) -> Void
  
  init(url: NSURL) {
    self.queryURL = url
  }
  
  func downloadJSONFromURL(completion: JSONDictionaryCompletion) {
    
    let request: NSURLRequest = NSURLRequest(URL: queryURL)
    let dataTask = session.dataTaskWithRequest(request) {
      (let data, let response, let error) in
      
      // 1. Check HTTP response for successful GET request
      if let httpResponse = response as? NSHTTPURLResponse {
        switch(httpResponse.statusCode) {
        case 200:
          // 2. Create JSON object with data
          do { let jsonDictionary = try NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions()) as! [String: AnyObject]
            completion(jsonDictionary) }
          catch {
            print("JSON Serialization failed. Error: \(error)")
          }
        default:
          print("GET request not successful HTTP status code: \(httpResponse.statusCode)")
        }
      } else {
        print("Error: Not a valid HTTP response")
      }
      
    }
    dataTask.resume()
  }
}

let forecastAPIKey = "09beb3fcfafdc31f8d9d15bdcc4a8060"
let forecastBaseURL = NSURL(string: "https://api.forecast.io/forecast/\(forecastAPIKey)/")
let lat = -78.422886
let long = -15.205077
let forecastURL = NSURL(string: "\(lat),\(long)", relativeToURL: forecastBaseURL)
NetworkOperation.downloadJSONFromURL(forecastURL)