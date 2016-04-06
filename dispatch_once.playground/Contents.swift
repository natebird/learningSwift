//: Playground - noun: a place where people can play

import Foundation

struct Static {
    static var dispatchOnceToken: dispatch_once_t = 0
}

func test() {
    dispatch_once(&Static.dispatchOnceToken) {
        print("This is printed only on the first call to test()")
    }
    print("This is printed for each call to test()")
}

for _ in 0..<4 {
    test()
}