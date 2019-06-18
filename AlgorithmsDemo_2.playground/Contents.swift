//: Playground - noun: a place where people can play
import Foundation


/*let array1 = [1,2,3]
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

let sum = array3.reduce(0, +)*/

//*********Single Link List*******//
//1->2->3->nil

class Node{
    var value : Int = 0
    var nextNode : Node?
    
    init(value : Int, next : Node?) {
        self.value = value
        self.nextNode = next
    }

}


let nodeThree : Node = Node(value: 3, next: nil)
let nodeTwo : Node = Node(value: 2, next: nodeThree)
let nodeOne : Node = Node(value: 1, next: nodeTwo)


func printLinkListWith(node : Node?){
    print("Link List :")
    var currentNode = node
    while currentNode != nil {
        print("\(String(describing: currentNode?.value))")
        currentNode = currentNode?.nextNode
    }
}

printLinkListWith(node: nodeOne)
//******Reverse Single Link List********//
//nil<-1<-2<-3
func reverseLiskListWith(head : Node?) -> Node?{
    var currentNode = head
    var next : Node?
    var previous : Node?
    while currentNode != nil {
        next = currentNode?.nextNode
        currentNode?.nextNode = previous
        print("Previous : \(previous?.value ?? -1), Current : \(currentNode?.value ?? -1), Next : \(next?.value ?? -1)")
        previous = currentNode
        currentNode =  next
    }
    
    return previous
}

let reverseLink = reverseLiskListWith(head: nodeOne)
printLinkListWith(node: reverseLink)
//*****Insertion*******//
class LinkList{
    
    var head : Node?
    
    func setUpLinkList(){
        let nodeThree : Node = Node(value: 3, next: nil)
        let nodeTwo : Node = Node(value: 2, next: nodeThree)
        head  = Node(value: 1, next: nodeTwo)
    }
    
    func displayItem(){
        print("Display Link List")
        var currentNode = head
        while currentNode != nil {
            print("\(currentNode?.value ??  -1)")
            currentNode = currentNode?.nextNode
        }
    }
    
    func insert(value : Int){
        
        if head == nil{
            head = Node(value: 1, next: nil)
            return
        }
        
        var currentNode = head
        while currentNode?.nextNode != nil {
            currentNode = currentNode?.nextNode
        }
        
        currentNode?.nextNode = Node(value: value, next: nil)
        
    }
    
    func delete(value : Int){
        if head?.value == value{
            head = head?.nextNode
            return
        }
        var current = head
        var prev : Node?
        while current != nil && current?.value != value {
            prev = current
            current = current?.nextNode
        }
        prev?.nextNode = current?.nextNode
    }
    
    func  midNode(head : Node?) -> Node?{
        var slowNode = head
        var fastNode = head
        while fastNode != nil && fastNode?.nextNode != nil {
            slowNode = slowNode?.nextNode
            fastNode = fastNode?.nextNode?.nextNode
        }
        
        return slowNode
    }
    
}

let list = LinkList()
list.setUpLinkList()
list.displayItem()
list.insert(value: 4)
list.insert(value: 5)
list.insert(value: 6)
list.displayItem()
list.delete(value: 6)
list.displayItem()
let midNode = list.midNode(head: nodeOne)
print("\(String(describing: midNode?.value))")

//******Heap**********//
struct MinHeap{
    
    var items : [Int] = [Int]()
    //Get Index
    private func getLeftChildIndex( parentIndex : Int) -> Int{
        return 2*parentIndex + 1
    }
    private func getRightChildIndex( parentIndex : Int) -> Int{
        return 2*parentIndex + 2
    }
    private func getParentIndex(childIndex : Int) -> Int{
        return (childIndex - 1) / 2
    }
    //Get Boolean Check
    private func hasLeftChild(index : Int) -> Bool{
        return getLeftChildIndex(parentIndex: index) < items.count
    }
    private func hasRightChild(index : Int) -> Bool{
        return getRightChildIndex(parentIndex: index) < items.count
    }
    private func hasParent(index : Int) -> Bool{
        return getParentIndex(childIndex: index) >= 0
    }
    //Return an item from heap
    private func leftChild(index : Int) -> Int{
        return items[getLeftChildIndex(parentIndex: index)]
    }
    private func rightChild(index : Int) -> Int{
        return items[getRightChildIndex(parentIndex: index)]
    }
    private func parent(index : Int) -> Int{
        return items[getParentIndex(childIndex: index)]
    }
    private  mutating func swap(indexOne : Int, indexTwo : Int){
        let placeHolder = items[indexOne]
        items[indexOne] = items[indexTwo]
        items[indexTwo] = placeHolder
    }
    
    public func peek() -> Int{
        if items.count != 0{
            return items[0]
        }else{
            fatalError()
        }
    }
    
    
  private  func isRoot(_ index: Int) -> Bool {
        return index == 0
    }
    
    mutating public func poll() -> Int{
        if items.count != 0{
            let item = items[0]
            items[0] = items[items.count - 1]
            headTraverseDown()
            return item
        }else{
            fatalError()
        }
    }
    
   mutating  public func add(item : Int){
        items.append(item)
        headTraverseUp()
    }
    
    private func headTraverseDown() -> Void{
        
        
    }
    
    private func headTraverseUp() -> Void{
        
    }
    
}

class Employee{
    public static var employeeCount : Int = 0
}
Employee.employeeCount += 1
var emp1: Employee = Employee()
Employee.employeeCount += 1
var emp2: Employee = Employee()
print(Employee.employeeCount)
