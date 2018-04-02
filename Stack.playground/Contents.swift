
import UIKit

class Node {
    var pointerNext: Node?
    var data: String
    
    init(data: String) {
        self.data = data
    }
}


struct Stack {
    var tail: Node?
    
    
    
    init() {
        tail = Node(data:"tail")
    }
    
    mutating func add(data: String) {
        
        let newNode :Node? = Node(data:data)
        newNode?.pointerNext = tail
        tail = newNode
    }
    
    mutating func get() -> String? {
        let result = tail?.data
        deleteFirst()
        return result
    }
    
    mutating func deleteFirst(){
        tail = tail?.pointerNext
    }
    
    func showAll() {
        var node: Node? = tail
        while(node?.pointerNext != nil) {
            node = node?.pointerNext
            print( node?.data ?? "no data")
        }
        
    }
    
}

//var l = Stack()
//
//l.add(data:"1")
//l.add(data:"2")
//l.add(data:"3")
//l.add(data:"4")
//
//print(l.get())
//print(l.get())
//print(l.get())
//l.add(data:"my")
//print(l.get())
//print(l.get())

















