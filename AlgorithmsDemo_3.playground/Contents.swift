import Foundation
//*************Binary Search*************//
let binarySearchArray = [1, 2, 4, 8, 9, 11, 13, 18, 20, 24]
var numers = [Int]()

for i in 1...100 {
    numers.append(i)
}

func binarySearchWith(element : Int, array : [Int]) -> Bool{
    var leftIndex = 0
    var rightIndex = array.count - 1
    
    while leftIndex <= rightIndex {
        
        let midIndex = (leftIndex + rightIndex)/2
        let midValue = array[midIndex]
        print("MiddleValue : \(midValue), leftindex : \(leftIndex) and rightIndex : \(rightIndex) in array items [\(array[leftIndex]), \(array[rightIndex])]")

        if element == midValue{
            return true
        }
        if element < midValue{
            rightIndex = midIndex - 1
        }else if element > midValue{
            leftIndex = midIndex + 1
        }
       
    }
    return false
}

print("\(binarySearchWith(element: 45, array: numers))") //[Time-space complexity in log(n)]
//*********Factorial**********//
let factorialNumber = 4

func findFactorialWith(item : Int) -> Int{
    var maxNumber = item
    var facTotal = 1
    while maxNumber > 0 {
        facTotal = maxNumber * facTotal
        maxNumber = maxNumber - 1
    }
    return facTotal
}
print("\(findFactorialWith(item: factorialNumber))")

func factorialSecondType(element : Int) -> Int{
    guard  element > 0 else{
        return 1
    }
    return element*factorialSecondType(element: element - 1)
}
print("\(factorialSecondType(element: factorialNumber))")
//********Find most common name in Array****//
let names = ["Subhra", "Mamma", "Muti", "Mamma", "Subhra", "Hati", "Muti", "Mamma"]
func  repeatedCommonNameWith(array : [String]) -> String{
    var commonNameDict = [String : Int]()
    for name in array{
        if let count = commonNameDict[name]{
            commonNameDict[name] =  count + 1
        }else{
            commonNameDict[name] = 1
        }
    }
    var mostCommonName = ""
    for key in commonNameDict.keys {
        if mostCommonName == "" {
            mostCommonName = key
        }else{
            let count : Int = commonNameDict[key]!
            if count > commonNameDict[mostCommonName]! {
                mostCommonName = key
            }
        }
        print("\(key) : \(String(describing: commonNameDict[key]!))")
    }
    return mostCommonName
}

print("Most common name : \(repeatedCommonNameWith(array: names))")
//******Reverse every words in sentence*******//
let sentence = "Let start today by completing very interesting task"
func reverseEachWordIn(line : String) -> String{
    let allWords = line.components(separatedBy: " ")
    var newSentence : String = ""
    for word in allWords{
        let reverseWord = word.reversed()
        newSentence = newSentence + reverseWord + " "
    }
    return newSentence
}

print("\(reverseEachWordIn(line: sentence))")
//********Fibonacci Sequence*******//
let maxElement = 5 //[0, 1, 1, 2, 3 ]

func createFibonacciSequenceWith(maxNo : Int) -> [Int]{
    
    let firstElement = 0
    let secondElement = 1
    
    var array : [Int] = [Int]()
    array.append(firstElement)
    array.append(secondElement)
    
    for i in 2 ..< maxNo{
        array.append(array[i - 1] + array[i - 2])
    }
    
    return array
}

print("\(createFibonacciSequenceWith(maxNo: maxElement))")
//******** Wrapping an Array**********//
let trackArray = ["a", "b", "c", "d", "e"]
func wrapingAnArrayWith(trackArr : [String], selectedTrack : String) -> [String]{
    var playTrackArr : [String] = [String]()
    var priorTrackArr : [String] = [String]()

    for track in trackArr{
        
        if track == selectedTrack || playTrackArr.count > 0{
            playTrackArr.append(track)
        }else{
            priorTrackArr.append(track)
        }
    }

    return playTrackArr + priorTrackArr
    
}

let wapperArray = wrapingAnArrayWith(trackArr: trackArray, selectedTrack: "d")
print("\(wapperArray)")

let prefixArray = wapperArray.prefix(upTo: 3)
let suffixArray = wapperArray.suffix(from: 3)
//**********Reduce Array**********//
let numbersArr = [1, 2, 3, 4]
let reduceArray = numbersArr.reduce(0, {sum, number in sum + number})
print("\(reduceArray)")
//************Recursive Binary search tree********//
/*     10
        / \
    5     14
   /        /  \
1         11   20
*/

class Node{
    var value : Int = 0
    var leftNode : Node?
    var rightNode : Node?
    
    init(value : Int, leftChild : Node?, rightChild : Node?) {
        self.value = value
        self.leftNode = leftChild
        self.rightNode = rightChild
    }
}
let twentyNode = Node(value: 20, leftChild: nil, rightChild: nil)
let elevenNode = Node(value: 11, leftChild: nil, rightChild: nil)
let oneNode = Node(value: 1, leftChild: nil, rightChild: nil)

let forteenNode = Node(value: 14, leftChild: elevenNode, rightChild: twentyNode)
let fiveNode = Node(value: 5, leftChild: oneNode, rightChild: nil)
let rootNode = Node(value: 10, leftChild: fiveNode, rightChild: forteenNode)

func searchInTreeWith(node : Node?, searchValue : Int) -> Bool{
    guard let treeNode : Node = node else { return false }
    
    if treeNode.value == searchValue{ return true }
    else if searchValue < treeNode.value {
       return searchInTreeWith(node: treeNode.leftNode, searchValue: searchValue)
    }else {
        return searchInTreeWith(node: treeNode.rightNode, searchValue: searchValue)
    }
}

print("\(searchInTreeWith(node: rootNode, searchValue: 20))")

// 5 * 25 + 6
//            +
//        /     \
//      *       5
//     /  \
//    25 6


class OperationNode{
    var operation : String? // +, - , *, /
    var value : Int?
    var leftNode : OperationNode?
    var rightNode : OperationNode?
    init(operation : String?, value : Int?, left : OperationNode?, right : OperationNode?) {
        self.operation = operation
        self.value = value
        self.leftNode = left
        self.rightNode = right
    }
}

let node_25 = OperationNode(operation: nil, value: 25, left: nil, right: nil)
let node_6 = OperationNode(operation: nil, value: 6, left: nil, right: nil)
let node_multiply_25_6 = OperationNode(operation: "*", value: nil, left: node_25, right: node_6)
let node_5 = OperationNode(operation: nil, value: 5, left: nil, right: nil)
let rootPlusNode = OperationNode(operation: "+", value: nil, left: node_multiply_25_6, right: node_5)

func evaluateNode(node : OperationNode?) -> Int{
    
    guard let currentNode : OperationNode = node else { return 0 }
    if currentNode.value != nil{
        return currentNode.value!
    }else if currentNode.operation == "+" {
        return  evaluateNode(node: currentNode.leftNode) + evaluateNode(node: currentNode.rightNode)
    }else if currentNode.operation == "*" {
        return  evaluateNode(node: currentNode.leftNode) * evaluateNode(node: currentNode.rightNode)
    }else if currentNode.operation == "-" {
        return  evaluateNode(node: currentNode.leftNode) * evaluateNode(node: currentNode.rightNode)
    }else if currentNode.operation == "/",  let rightChild = currentNode.rightNode, let rightValue = rightChild.value, rightValue > 0 {
        return  evaluateNode(node: currentNode.leftNode) * evaluateNode(node: currentNode.rightNode)
    }
    
    return 0
}

print("\(evaluateNode(node: rootPlusNode))")

//********Flatten a nested Array*************//
//[1, [2, [3, 4] ] ] ----> [1, 2, 3, 4]

let nonFlattenArray : [Any] = [ [-1, 0],1, [2, [3, [4, 5, [6, 7, 8] ] ] ] ]
func flattenArrayWith(array : [Any]) -> [Int]{
    var myFlattenArr : [Int] = [Int]()
    for ele in array{
        if ele is Int {
            myFlattenArr.append(ele as! Int)
        }else if ele is [Any]{
            let result = flattenArrayWith(array: ele as! [Any])
            for element in result {
                myFlattenArr.append(element)
            }
        }
        
    }
    return myFlattenArr
}

print("\(flattenArrayWith(array: nonFlattenArray))")

/*Given a string containing of ‘0’, ‘1’ and ‘?’ wildcard characters, generate all binary strings that can be formed by replacing each wildcard character by ‘0’ or ‘1’.*/

func printBinaryDigitWith(string : String, index : Int) -> Void{
    
    let mutableStr : String = string
    
    if index == mutableStr.count  {
        print("\(mutableStr)")
        return
    }else{
        guard let index0 : String.Index = string.firstIndex(of: "?") else {
            
            return
        }
        // let position : String.IndexDistance = mutableStr.distance(from: mutableStr.startIndex, to: idx)
        let newStr0 : String = mutableStr.replaceCharacterAt(index: index0.encodedOffset, with: String.Element("0"))
        print("\(newStr0)")
        guard let index1 : String.Index = newStr0.firstIndex(of: "?") else {
            
            return
        }
        let newStr1 : String = newStr0.replaceCharacterAt(index: index1.encodedOffset, with: String.Element("1"))
        print("\(newStr1)")
        printBinaryDigitWith(string: newStr1, index: (index1.encodedOffset + 1))
    }
    
}

extension String{
    func replaceCharacterAt(index : Int, with character : String.Element) -> String{
        
        var characters : [String.Element] =  Array(self)
        characters[index] = character
        let newString : String = String(characters)
        return newString
    }
}

printBinaryDigitWith(string: "1??0?101", index: 0)
//***********Find multiple occurarnce of letter**********//

func findMultipleOccuranceIn(text : String) -> [Character]{
    var characterSet : Set<Character> = Set<Character>()
    let characters : [Character] = Array(text)
    var outputArr : [Character] = [Character]()
    print("\(characters)")
    for (_ , character) in characters.enumerated(){
        if characterSet.contains(character){
            outputArr.append(character)
        }else{
            characterSet.insert(character)
        }
    }
    return outputArr
}

print("\(findMultipleOccuranceIn(text: "BCABA"))")
