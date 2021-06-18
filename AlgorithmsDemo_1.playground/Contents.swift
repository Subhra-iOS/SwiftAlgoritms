//: Playground - noun: a place where people can play

//import UIKit
import Foundation

//----------Linear Search----------//
func linearSearch<T: Equatable>(_ array: [T], _ object: T) -> Int? {
	for (index, obj) in array.enumerated() where obj == object {
		return index
	}
	return nil
}

//let array = [5,2,4,7]
//linearSearch(array, 4) 	// This will return 1

//-----------Binary Search---------//

func binarySearch<T: Comparable>(_ a: [T], key: T, range: Range<Int>) -> Int? {
	if range.lowerBound >= range.upperBound {
		// If we get here, then the search key is not present in the array.
		return nil
		
	} else {
		// Calculate where to split the array.
		let midIndex = range.lowerBound + (range.upperBound - range.lowerBound) / 2
		
		// Is the search key in the left half?
		if a[midIndex] > key {
			return binarySearch(a, key: key, range: range.lowerBound ..< midIndex)
			
			// Is the search key in the right half?
		} else if a[midIndex] < key {
			return binarySearch(a, key: key, range: midIndex + 1 ..< range.upperBound)
			
			// If we get here, then we've found the search key!
		} else {
			return midIndex
		}
	}
}

let numbers = [11, 59, 3, 2, 53, 17, 31, 7, 19, 67, 47, 13, 37, 61, 29, 43, 5, 41, 23]

numbers.firstIndex(of: 43)  // returns 15

//MARK:---------- Bubble Sort---------------//

var unsortedArray = [10, 22, 50, 9, 33, 41, 21, 40, 80, 60, 26]

func showBubbleSort(){
	
	var result = unsortedArray
	//var didSwap = false
	
	for i in 0..<unsortedArray.count-1{
		for j in 0..<unsortedArray.count-i-1{
			
			if(result[j] > result[j+1]){
				let temp = result[j]
				result[j] = result[j+1]
				result[j+1] = temp
			}
		}
	}
	
	print(result)

}

showBubbleSort()

func generateFibonnaciSeries(){
	
	    var mArray : [NSNumber] = Array();
		let fibNum1 = NSNumber(value: Double(1))
		let fibNum2 = NSNumber(value: Double(1))
		mArray.append(fibNum1)
	    mArray.append(fibNum2)
	
		var i = 2
		for i in 2 ..< 20{
			
            mArray.append(NSNumber(value: Double(truncating: mArray[i-1]) +  Double(truncating: mArray[i-2])))
		}
		print("mArray \(mArray)");
}

generateFibonnaciSeries

/*func depthFirstSearch(_ graph: Graph, source: Node) -> [String] {
	var nodesExplored = [source.label]
	source.visited = true
	
	for edge in source.neighbors {
		if !edge.neighbor.visited {
			nodesExplored += depthFirstSearch(graph, source: edge.neighbor)
		}
	}
	return nodesExplored
}

let graph = Graph()

let nodeA = graph.addNode("a")
let nodeB = graph.addNode("b")
let nodeC = graph.addNode("c")
let nodeD = graph.addNode("d")
let nodeE = graph.addNode("e")
let nodeF = graph.addNode("f")
let nodeG = graph.addNode("g")
let nodeH = graph.addNode("h")

graph.addEdge(nodeA, neighbor: nodeB)
graph.addEdge(nodeA, neighbor: nodeC)
graph.addEdge(nodeB, neighbor: nodeD)
graph.addEdge(nodeB, neighbor: nodeE)
graph.addEdge(nodeC, neighbor: nodeF)
graph.addEdge(nodeC, neighbor: nodeG)
graph.addEdge(nodeE, neighbor: nodeH)
graph.addEdge(nodeE, neighbor: nodeF)
graph.addEdge(nodeF, neighbor: nodeG)

let nodesExplored = depthFirstSearch(graph, source: nodeA)
print(nodesExplored) //This will output: ["a", "b", "d", "e", "h", "f", "g", "c"]
*/

print("\n")

func starPattern1() -> Void{
	
	for i in 0..<6 {
		var star : String = ""
        for _ in (i+1)..<6 {
			star = star + "*"
		}
		print("\(star)")
	}

}

starPattern1()
print("\n")


func starPattern2() -> Void{
	
	for i in 0..<6{
		var star : String = ""
        for _ in 1...(i+1){
			star = star + "*"
		}
		print("\(star)")
	}
	
}

starPattern2()
print("\n")


func starPattern3() -> Void{
	
	for i in 0..<6{
		var star : String = ""
		let space : String = String(repeating: " ", count: i)

		for j in i..<6{
			if i==j{
			 star = space + star + "*"
			}else{
				star = star + "*"
			}
		}
		
		print("\(star)")
	}
	
}

starPattern3()
print("\n")


func starPattern4() -> Void{
	
	for i in (0..<6).reversed(){
		var star : String = ""
		let space : String = String(repeating: " ", count: i)
		
		for j in (i..<6).reversed(){
			if i==j{
				star = space + star + "*"
			}else{
				star = star + "*"
			}
		}
		
		print("\(star)")
	}
	
}

starPattern4()
print("\n")

let treeHeight = 5
let treeWidth = treeHeight * 2 - 1

for lineNumber in 1...treeHeight {
	
	// How many asterisks to print
	let stars = 2 * lineNumber - 1
	var line = ""
	
	// Half the non-star space
	let spaces = (treeWidth - stars) / 2
	if spaces > 0 {
		line = String(repeating: " ", count: spaces)
	}
	
	line += String(repeating: "*", count: stars)
	print (line)
}

print("\n")

var arr : Array<Int> = [10,80,30,50,40,90,70]

func quickSort( _ array: [Int]) -> [Int] {
	if array.isEmpty { return [] } // 1
	let first = array.first! // 2
	let smallerOrEqual = array.dropFirst().filter { $0 <= first } // 3
	let larger         = array.dropFirst().filter { $0 > first } // 4
	return quickSort(smallerOrEqual) + [first] + quickSort(larger) // 5
}

print("First Logic : \(quickSort(arr))")
print("\n")

func quicksort1( _ list: [Int]) -> [Int] {
	if list.count <= 1 {
		return list
	}
	
	let pivot = list[0]
	
	var smallerList = [Int]()
	var equalList = [Int]()
	var biggerList = [Int]()
	
	for x in list {
		switch x {
		case let x where x < pivot:
			smallerList.append(x)
		case let x where x == pivot:
			equalList.append(x)
		case let x where x > pivot:
			biggerList.append(x)
		default:
			break
		}
	}
	
	return quicksort1(smallerList) + equalList + quicksort1(biggerList)
}

print("Second logic : \(quicksort1(arr))")
print("\n")

func mergeSort1<T: Comparable>(array: inout [T], startIndex: Int, endIndex: Int) {
	// Base case
	if startIndex >= endIndex {
		return
	}
	
	let middleIndex = (startIndex + endIndex) / 2
	mergeSort1(array: &array, startIndex: startIndex, endIndex: middleIndex)
	mergeSort1(array: &array, startIndex: middleIndex+1, endIndex: endIndex)
	merge(array: &array, startIndex: startIndex, middleIndex: middleIndex, endIndex: endIndex)
}

func merge<T: Comparable> (array: inout [T], startIndex: Int, middleIndex: Int, endIndex: Int) {
	let leftSubarray = Array(array[startIndex...middleIndex])
	let rightSubarray = Array(array[middleIndex+1...endIndex])
	
	var index = startIndex
	var leftIndex = 0
	var rightIndex = 0
	
	while leftIndex < leftSubarray.count && rightIndex < rightSubarray.count {
		if leftSubarray[leftIndex] < rightSubarray[rightIndex] {
			array[index] = leftSubarray[leftIndex]
			leftIndex += 1
		}
		else {
			array[index] = rightSubarray[rightIndex]
			rightIndex += 1
		}
		index += 1
	}
	
	while leftIndex < leftSubarray.count {
		array[index] = leftSubarray[leftIndex]
		index += 1
		leftIndex += 1
	}
	
	while rightIndex < rightSubarray.count {
		array[index] = rightSubarray[rightIndex]
		index += 1
		rightIndex += 1
	}
}

//print("Merge sort logic : \(mergeSort1(array: &arr, startIndex: 0, endIndex: arr.count))")
print("\n")

//Largest Sum Contiguous Subarray (Contiguous : Element of consecutive indexes)
let sub_Array = [-2,-3,4,-1,-2,1,5,-3]

func sumOfContiguousSubArray(_ subArray : [Int]) -> Int{
	
	var contiguous_max = 0
	var max_sum_end = 0
	
	for (_,element) in subArray.enumerated(){
		
		max_sum_end = max_sum_end + element
		if max_sum_end < 0 { max_sum_end = 0 }
		else if contiguous_max < max_sum_end{ contiguous_max = max_sum_end }
	}
	
	return contiguous_max
	
}

print("Largest Sum of contiguous subarray : \(sumOfContiguousSubArray(sub_Array))")
print("\n")

//Largest Sum Contiguous Subarray for all negative element (Contiguous : Element of consecutive indexes)
func sumOfAllNegativeContiguousSubArray(_ subArray : [Int]) -> Int{
	
	var contiguous_max = subArray[0]
	var max_sum_end = subArray[0]
	
	for i in 1..<subArray.count{
		
		max_sum_end = max(subArray[i], (max_sum_end + subArray[i]))
		contiguous_max = max(contiguous_max, max_sum_end)
	}
	
	return contiguous_max
	
}

print("Largest Sum of all -ve contiguous subarray : \(sumOfAllNegativeContiguousSubArray(sub_Array))")
print("\n")

// Count of inversion in an array.For a sorted array inversion count in 0 and for sorted array in reverse inversion count is maximum.

// if a[i] > a[j] and i<j or i> then inversion count happens.

//Stock Buy Sell to Maximize Profit

let buySellStockArr = [100,180,260,310,40,550,690]
//let buySellStockArr = [100,180,30,310,400,550,690]


struct Stock{
	
	var buy : Int = 0
	var sell : Int = 0
}

func stockBuySell(_ stocks : [Int], _ sizeOfArray : Int) -> Void{
	
	let n : Int = sizeOfArray
	
	if n == 1 {
		return
	}
	
	var count : Int = 0
	var solutions : Array<Stock> = [Stock](repeating: Stock(), count: (n/2 + 1))
	var i : Int = 0
	
	while (i < (n - 1)){
		
		while((i < (n - 1)) && (stocks[i] > stocks[i+1])){
			i = i + 1
		}
		
		if (i == (n - 1)) { break }
		
		i = i + 1
		solutions[count].buy = i
		
		while(i < n && (stocks[i] >= stocks[i-1])){
			i = i + 1
		}
		
		i = i - 1

		solutions[count].sell = i
		count = count + 1
	}
	
	for i in 0 ..< count{
		
		print("Buy on day : \(solutions[i].buy) and Sell on day: \(solutions[i].sell)")
	}
	
}

print("\(stockBuySell(buySellStockArr,buySellStockArr.count))")
print("\n")
//Sort an array in wave form
let unsortedWaveArray = [10,49,90,2,1,5,23]

func sortInWaveFormWith( _ arr : [Int]) -> [Int] {
	
	var list : [Int] = arr
	let evenIndexes = (0..<list.count).filter { $0 % 2 == 0 }
	
	for index in evenIndexes {
		if index > 0 ,list[index] > list[index-1] {
			list.swapAt(index, index-1)
		}
		
		if index < (list.count - 1) , list[index] > list[index+1] {
			list.swapAt(index, index+1)
		}
	}
	
	
	return  list
}

print("wave sort : \(sortInWaveFormWith(unsortedWaveArray))")
print("\n")
