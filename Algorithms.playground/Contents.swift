import Foundation

//*********Insertion sort*********//

func insertionSort(array : [Int]) -> [Int] {
    
    var unsortedArray : [Int] = array
    
        for index in 0 ..< unsortedArray.count{
            
            var currentIndex : Int = index
            if currentIndex <= 0 {
                currentIndex = currentIndex + 1
            }else{
            }
            
            let temp = unsortedArray[currentIndex]
            while currentIndex > 0, temp < unsortedArray[currentIndex - 1]{
                
                //unsortedArray[currentIndex] = unsortedArray[currentIndex - 1] or
                unsortedArray.swapAt(currentIndex, currentIndex - 1)
                currentIndex = currentIndex - 1
                
            }
            
            unsortedArray[currentIndex] = temp
            
        }
    
    return unsortedArray
        
    }


let unsortedArray : [Int] = [8, 3, 5, 1, 10, 6, 2]

print("Insertion Sort : \(insertionSort(array: unsortedArray))")

//*******Bubble Sort********//

extension Array where Element: Comparable{
    
    func bubbleSort() -> [Element]{
        
        let array = self
        var unsortedArray : [Element] = array
        
        for i in 0 ..< (unsortedArray.count - 1) {
            
            for j in 0 ..< (unsortedArray.count - i - 1) where  unsortedArray[j] > unsortedArray[j+1]{
                
                unsortedArray.swapAt(j, j+1)
                
            }
            
        }
        
        return unsortedArray
    }
    
}

let unsortedBubbleArray : [Int] =  [8, 3, 5, 1, 10, 6, 2] //[4, 2, 0, 1]

print("Bubble Sort : \(unsortedBubbleArray.bubbleSort())")

//*****Selection Sort********//

extension Array where Element: Comparable{
    
    func selectionSort(by compare : ((Element, Element) -> Bool) = (<)) -> [Element]{
        
        let array = self
        var unsortedArray : [Element] = array
        
        for i in 0 ..< (unsortedArray.count - 1) {
            
            var key = i
            
            for j in i+1 ..< unsortedArray.count where  compare(unsortedArray[j], unsortedArray[key]){ //unsortedArray[j] < unsortedArray[key]
                
                key = j
                
            }
            
            guard i != key else{ continue }
            
            unsortedArray.swapAt(i, key)

            
        }
        
        return unsortedArray
    }
    
}

let unsortedSelectionArray : [Int] =  [8, 3, 5, 1, 10, 6, 2]

print("Selection Sort : \(unsortedSelectionArray.selectionSort(by: >))")

//*****Merge Sort*******//

extension Array where Element : Comparable{
    
    func mergeSort(leftArray : [Element], rightArray : [Element], compare : ((Element, Element) -> Bool) = (<)) -> [Element]{
        
        var outputArray : [Element] = [Element]()
        var mutableRight = rightArray
        var mutableLeft = leftArray
        
        while mutableRight.count > 0, mutableLeft.count > 0 {
            
            if let firstElement = mutableLeft.first, let secondElement = mutableRight.first{
                
                if !compare(firstElement, secondElement){
                    outputArray.append(secondElement)
                    mutableRight.remove(at: 0)
                }else{
                    outputArray.append(firstElement)
                    mutableLeft.remove(at: 0)
                }
                
            }
        }
        
        outputArray.append(contentsOf: mutableLeft)
        outputArray.append(contentsOf: mutableRight)
        
        return outputArray
    }
    
    func splitAndMerge(by compare : ((Element, Element) -> Bool) = (<)) -> [Element]{
        
        var inputArray = self
        
        if inputArray.count < 2 { return inputArray }
        
        let leftArray = Array(inputArray[0 ..< Int(inputArray.count/2)])
        let rightArray = Array(inputArray[Int(inputArray.count/2) ..< Int(inputArray.count)])
        
        return  mergeSort(leftArray: leftArray.splitAndMerge(by: compare), rightArray: rightArray.splitAndMerge(by: compare), compare: compare)
        
    }
    
}

let unsortedMergeArray : [Int] =  [8, 3, 5, 1, 10, 6, 2]

print("Merg Sort : \(unsortedMergeArray.splitAndMerge(by: <))")

//*****Quick Sort****//

extension Array where Element : Comparable{
    
    func quickSort(by compare : ((Element, Element) -> Bool) = (<)) -> [Element]{
        
        var array : [Element] = self
        if array.count < 2 { return array }
        
        let pivotElement = array.remove(at: 0)
        
        let leftArray = array.filter{ compare($0, pivotElement) }
        let rightArray = array.filter{ !compare($0, pivotElement) }
        
        let middleArray = [pivotElement]
        
        return leftArray.quickSort(by: compare) + middleArray + rightArray.quickSort(by: compare)
        
    }
    
}

let unsortedQuickArray : [Int] =  [8, 3, 5, 1, 10, 6, 2]

print("Quick Sort : \(unsortedQuickArray.quickSort(by: <))")

//*********Median of two Array**********//
let arr1 = [1,3, 5]
let arr2 = [2, 4, 6]

func medianOfTwoSortedArrayWith(firstArr : [Int], secondArr : [Int]) -> Float{
    
    var sortedArray = [Int]()
    let firstArrCount = firstArr.count
    let secondArrCount = secondArr.count
    var rightIndex = 0
    var leftIndex = 0
    
    while(leftIndex < firstArrCount && rightIndex < secondArrCount ){
        if firstArr[leftIndex] < secondArr[rightIndex]{
            sortedArray.append(firstArr[leftIndex])
            leftIndex = leftIndex + 1
            
        }else if secondArr[rightIndex] < firstArr[leftIndex]{
            sortedArray.append(secondArr[rightIndex])
            rightIndex = rightIndex + 1
            
        }else{
            sortedArray.append(firstArr[leftIndex])
            leftIndex = leftIndex + 1
            sortedArray.append(secondArr[rightIndex])
            rightIndex = rightIndex + 1
        }
    }
    
    while leftIndex < firstArr.count {
        sortedArray.append(firstArr[leftIndex])
        leftIndex = leftIndex + 1
    }
    
    while rightIndex < secondArr.count {
        sortedArray.append(secondArr[rightIndex])
        rightIndex = rightIndex + 1
    }
    
    print("Sorted Array : \(sortedArray)")
    
    let middleValue = sortedArray[(firstArrCount + secondArrCount)/2]
    let preMiddleValue = sortedArray[((firstArrCount + secondArrCount)/2) - 1]
    
    let median = Float(middleValue + preMiddleValue)/2
    
    return median
}

print("\(medianOfTwoSortedArrayWith(firstArr: arr1, secondArr: arr2))")

//******Find duplicate from array****//
let array = [1, 3, 1, 4, 3, 6]

func  findDuplicateArrayWith(arr : [Int]) -> [Int]{
    
    var numericSet : Set = Set<Int>()
    var duplicates : [Int] = [Int]()
    for i in 0 ..< arr.count - 1{
        let value = arr[i]
        if numericSet.contains(value){
            duplicates.append(value)
        }else{
            numericSet.insert(value)
        }
    }
    return duplicates
    
}

print("Find duplicate : \(findDuplicateArrayWith(arr: array))")
//******Find longest consecutive numbers*********//

let unsortedArr = [4, 2, 1, 6, 5]

func  longestSequesnceConsequtiveArrWith(arr : [Int]) -> ( arrLength : Int, conArr : [Int]){
     var numericSet : Set = Set<Int>()
    for (_, value) in arr.enumerated(){
        numericSet.insert(value)
    }
    
    var consecutiveArr = [Int]()
    var maxLength = 0
    
    for (_, ele) in arr.enumerated() {
        var element = ele
        if numericSet.contains(element - 1){  continue }
        var len = 0
        while (numericSet.contains(element)) {
            len = len + 1
            consecutiveArr.append(element)
            element = element + 1
        }
         maxLength = max(maxLength, len)
    }
    return (maxLength, consecutiveArr)
}

print("\(longestSequesnceConsequtiveArrWith(arr: unsortedArr))")
//*********Stack*************//

struct  Stack<Element>{
    private var stackArr : [Element] = [Element]()
    
    mutating func push(element : Element) -> Void{
        stackArr.append(element)
    }
    
    mutating func pop() -> Element?{
        return stackArr.popLast()
    }
    
    func peek() -> Element?{
        return stackArr.last
    }
    
    func top() -> Element?{
        return stackArr.last
    }
    
    func allObjects() -> [Element]?{
        return stackArr
    }
    
    func isEmpty() -> Bool{
        return stackArr.count > 0 ? false : true
    }
    
}

let unSortStackArray = [8, 5, 7, 1, 9, 12, 10]

func sortArrayWithStackMethodWith(arr : [Int]) -> [Int]{
    
        var sortedArr : [Int]!
        var arrStack : Stack<Int> = Stack()
        for i in 0 ..< arr.count{
            arrStack.push(element: arr[i])
        }
    
        sortedArr = sortStackWith(inputStack: arrStack)
        return sortedArr
    }

private func sortStackWith(inputStack : Stack<Int>) -> [Int]{
    
    var tempStack : Stack<Int> = Stack()
    var input : Stack<Int> = inputStack
    
    while !input.isEmpty(){
        
        guard let temp = input.top() else { return [0] }
        input.pop()
       
        while !tempStack.isEmpty(), let lastElement = tempStack.top(), lastElement < temp {
            input.push(element: lastElement)
            print("\(input.allObjects()!)")
            tempStack.pop()
        }
        
        tempStack.push(element: temp)
        
    }
    
    return  input.allObjects()!
}

print("Sort Array with Stack : \(sortArrayWithStackMethodWith(arr: unSortStackArray))")

//**********Hash Table************//

struct HasTable<Key : Hashable, Value : Any>{
    fileprivate typealias Element = (key : Key, value : Value)
    fileprivate typealias HashBucket = [Element]
    private var hashBuckets : [HashBucket]?
    
    private var count = 0
    
    init(capacity : Int) {
        hashBuckets = [HashBucket](repeating: [], count: capacity)
    }
    
    public func empty() -> Bool{
        return count == 0
    }
    
    private func index(key : Key) -> Int{
        if let bucketArr = hashBuckets, bucketArr.count > 0{
            return abs(key.hashValue % bucketArr.count)
        }else{
            return 0
        }
    }
    
    public subscript (key : Key) -> Value?{
        get{
            return value(key: key)
        }
        set{
            if let value = newValue{
                update(value: value, forKey: key)
            }else{
                remove(forKey: key)
            }
        }
    }
    
    public func value(key : Key) -> Value?{
        let arrIndex = self.index(key: key)
        var result : Value?
        if let bucketArr : [HashBucket] = hashBuckets, bucketArr.count > 0{
            for (_ , element) in bucketArr[arrIndex].enumerated(){
                if element.key == key {
                    result = element.value
                    break
                }
            }
        }
        return result
    }
    
    public mutating func update(value : Value, forKey key : Key) -> Value?{
        let arrIndex = self.index(key: key)
        
        if var bucketArr : [HashBucket] = hashBuckets, bucketArr.count > 0{
            for (i , element) in bucketArr[arrIndex].enumerated(){
                if element.key == key {
                    let oldValue = element.value
                    hashBuckets?[arrIndex][i].value = value
                    return  oldValue
                }
            }
            hashBuckets?[arrIndex].append((key: key, value: value))
            count = count + 1
        }
        return  nil
    }
    
    public mutating func remove(forKey key : Key) -> Value?{
        let arrIndex = self.index(key: key)
        if var bucketArr : [HashBucket] = hashBuckets, bucketArr.count > 0{
            for (i , element) in bucketArr[arrIndex].enumerated(){
                if element.key == key {
                    let oldValue = element.value
                    hashBuckets?[arrIndex].remove(at: i)
                    count = count - 1
                    return  oldValue
                }
            }
        }
        return  nil
    }
    
    public mutating func removeAll(){
        self.hashBuckets = [HashBucket](repeating: [], count: self.hashBuckets!.count)
        self.count = 0
    }
    
}

var hashTable : HasTable = HasTable<String, Any>(capacity: 5)
hashTable["name"] = "Subhra Roy"
hashTable["phoneNumber"] = NSNumber(value: Int64(8902178012))

if let name : String = hashTable["name"] as? String{
    print("\(name)")
}

if let phoneNo : NSNumber = hashTable["phoneNumber"] as? NSNumber{
    print("\(phoneNo)")
}

//hashTable.remove(forKey: "phoneNumber")
hashTable.update(value: NSNumber(value: Int64(8902178010)), forKey: "phoneNumber")

if let phoneNo : NSNumber = hashTable["phoneNumber"] as? NSNumber{
    print("\(phoneNo)")
}else{
    print("No Phone Number")
}

//**********Palindrom***********//
 let sentence = "madam anna kayak notapalindrom anna civic racecar"

func checkPalindrom(str : String) -> Void {
    let  strArr = str.components(separatedBy: " ")
    strArr.forEach { (word) in
        if isPalindrom(aWord: word){
            print("\(word) is Palindrom")
        }else{
            print("\(word) is not a Palindrom")
        }
    }
}

private func isPalindrom(aWord : String) -> Bool{
    let characters = Array(aWord)
    var currentIndex = 0
    while currentIndex < (characters.count / 2) {
        if  characters[currentIndex] != characters[characters.count - currentIndex - 1]{
            return false
        }
        currentIndex = currentIndex + 1
    }
    return true
}

print("\(checkPalindrom(str: sentence))")

//recursive enumeration
indirect enum Algorithm<T> {
    
    case Empty
    case Elements(Array<T>)
    case InsertionSort(Algorithm<T>)
    case BubbleSort(Algorithm<T>)
    case SelectionSort(Algorithm<T>)
}

//build an algorithm model
let list = Algorithm.Elements([8, 2, 10, 9, 7, 5])
let model = Algorithm.BubbleSort(list)

print("\(model)")

extension  Int {
    
    func  fibonacciWith() -> Array<Int>?{
        
        guard self > 2 else{ return nil }
        
        var sequence : Array<Int> = [0, 1]
        var  i = sequence.count
        while i != self{
            
            let result = sequence[i - 1] + sequence[ i - 2]
            sequence.append(result)
            i = i + 1
        }
        
        return sequence
    }
    
}

let maxNumber : Int = 10
let sequence = maxNumber.fibonacciWith()
print("\(String(describing: sequence))")
