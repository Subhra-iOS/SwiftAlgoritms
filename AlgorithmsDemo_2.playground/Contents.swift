//: Playground - noun: a place where people can play
import Foundation


let array1 = [1,2,3]
let array2 = [4,2,2]

extension Array where Element: Hashable {
	func difference(from other: [Element]) -> [Element] {
		let thisSet = Set(self)
		let otherSet = Set(other)
		return Array(thisSet.symmetricDifference(otherSet))
	}
}

array1.difference(from: array2)


let array3 = [1,2,3,4,5]

let sum = array3.reduce(0, +)
