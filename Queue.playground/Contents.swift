
import UIKit

class Node {
    var pointerNext: Node?
    var data: String
    
    init(data: String) {
        self.data = data
    }
}


struct Queue {
    var head: Node?
    
    
    
    init() {
        head = Node(data: "head")
    }
    
    mutating func add(data: String) {

        var node = head
        while(node?.pointerNext != nil ){
            node = node?.pointerNext
        }
        node?.pointerNext = Node(data: data)
    }
    
    func get() -> String? {
        let result = head?.pointerNext?.data
        deleteFirst()
        return result
    }
    
    func deleteFirst() {
        head?.pointerNext = head?.pointerNext?.pointerNext
    }
    
    func showAll() {
        var node: Node? = head
        
        while(node?.pointerNext != nil) {
            node = node?.pointerNext
            print((node?.data)!)
        }
        
    }

}
//
//var queue = Queue();
//
//queue.add(data:"first")
//queue.add(data:"second")
//queue.add(data:"third")
//queue.add(data:"4")
//queue.add(data:"5")
//queue.get()
//queue.get()
//queue.add(data:"my")
//queue.showAll()

var l = Queue()

l.add(data: "1")
l.add(data: "2")
l.add(data: "3")
l.add(data: "4")

print(l.get())
print(l.get())
print(l.get())
l.add(data: "my")
print(l.get())
print(l.get())









