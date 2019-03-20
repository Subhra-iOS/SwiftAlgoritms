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

//****Fastest Search Algo ()*******//

