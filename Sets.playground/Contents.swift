//: Playground - noun: a place where people can play

import Foundation

var abcSet = Set(["A", "B", "C", "D"])
abcSet.contains("A")
abcSet.insert("E")
abcSet.remove("B")
abcSet
abcSet.count
abcSet.isEmpty
!abcSet.isEmpty
var numberSet = Set(["1", "2", "3", "4"])
var characterSet = abcSet.union(numberSet)
characterSet.isSupersetOf(abcSet)
characterSet.isSupersetOf(numberSet)
