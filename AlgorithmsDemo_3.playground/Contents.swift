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
