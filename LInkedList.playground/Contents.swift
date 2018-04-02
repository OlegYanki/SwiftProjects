import UIKit

class Node {
    var pointerNext: Node?
    var pointerPrevious: Node?
    var data: String
    
    init(data: String) {
        self.data = data
    }
}

struct List {
    let head = Node(data: "head")
    let tail = Node(data: "tail")
    
    
    init() {
        head.pointerNext = tail
        tail.pointerPrevious = head
    }
    
    mutating func addToEnd(data: String) {
        let a = tail.pointerPrevious
        tail.pointerPrevious = Node(data: data)
        tail.pointerPrevious?.pointerNext = tail
        tail.pointerPrevious?.pointerPrevious = a
        a?.pointerNext = tail.pointerPrevious
    }
    
    func showAll() {
        var node : Node? = head.pointerNext
        
        while(node !== tail) {
            print((node?.data)!)
            node = node?.pointerNext
        }
        
    }
    
    subscript(number:Int) -> String {
        get {
            var node: Node? = head
            for _ in 0...number {
                node = node?.pointerNext
            }

            return node!.data
        }
        set {
            var node: Node? = head

            for _ in 1...number {
                node = node?.pointerNext
            }

            let a = node?.pointerPrevious
            node?.pointerPrevious = Node(data: newValue)
            node?.pointerPrevious?.pointerNext = node
            node?.pointerPrevious?.pointerPrevious = a
            a?.pointerNext = node?.pointerPrevious
        }
    }
    
//    func getByNumber(number: Int) -> String {
//        var node: Node? = head
//        for _ in 0...number {
//            node = node?.pointerNext
//        }
//
//        guard let unwrapedData = node?.data
//        else {
//            return ""
//        }
//        return unwrapedData
//
//    }
//
//    func insertByNumber(number: Int,data: String) {
//        var node: Node? = head
//
//        for _ in 1...number {
//            node = node!.pointerNext
//        }
//
//        let a = node?.pointerPrevious
//        node?.pointerPrevious = Node(data: data)
//        node?.pointerPrevious?.pointerNext = node
//        node?.pointerPrevious?.pointerPrevious = a
//        a?.pointerNext = node?.pointerPrevious
//    }
    
    func deleteByNumber(number: Int) {
        var node: Node? = head
        for _ in 1...number {
            node = node?.pointerNext
        }
        node?.pointerPrevious?.pointerNext = node?.pointerNext
        node?.pointerNext?.pointerPrevious = node?.pointerPrevious
    }
}

var l = List()

l.addToEnd(data: "1")
l.addToEnd(data: "2")
l.addToEnd(data: "3")
l.addToEnd(data: "4")
l.addToEnd(data: "5")
l.addToEnd(data: "6")
l[1] = "123"
l.addToEnd(data: "6")
l.deleteByNumber(number: 3)
l.showAll()






