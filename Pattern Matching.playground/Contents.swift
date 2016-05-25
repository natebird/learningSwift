//: Playground - noun: a place where people can play
// http://alisoftware.github.io/swift/pattern-matching/2016/03/27/pattern-matching-1/

import Foundation


// Switch Basics
enum Direction {
    case North, South, East, West
}

extension Direction: CustomStringConvertible {
    var description: String {
        switch self {
        case North: return "⬆️"
        case South: return "⬇️"
        case East: return "➡️"
        case West: return "⬅️"
        }
    }
}

enum Media {
    case Book(title: String, author: String, year: Int)
    case Movie(title: String, director: String, year: Int)
    case WebSite(url: NSURL, title: String)
}

extension Media {
    var mediaTitle: String {
        switch self {
//        case .Book(title: let aTitle, author: let anAuthor, year: let aYear):
        case let .Book(title: aTitle, author: _, year: _):
            return aTitle
        case .Movie(title: let aTitle, director: _, year: _):
            return aTitle
        case .WebSite(url: _, title: let aTitle):
            return aTitle
        }
    }
}

let book = Media.Book(title: "20,000 leagues under the sea", author: "Jules Verne", year: 1870)
book.mediaTitle

// Using Fixed values
extension Media {
    var isFromJulesVerne: Bool {
        switch self {
        case .Book(title: _, author: "Jules Verne", year: _): return true
        case .Movie(title: _, director: "Jules Verne", year: _): return true
        default: return false
        }
    }
}
book.isFromJulesVerne

extension Media {
    func checkAuthor(author: String) -> Bool {
        switch self {
        case .Book(title: _, author: author, year: _): return true
        case .Movie(title: _, director: author, year: _): return true
        default: return false
        }
    }
}
book.checkAuthor("Jules Verne")

