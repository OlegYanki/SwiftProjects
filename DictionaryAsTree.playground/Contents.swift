//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

struct Key {
    var key: String
    
    init(_ key: String) {
        self.key = key
    }
    
    func hashCode() -> Int {
        let unicodeScalars = key.unicodeScalars.map { $0.value }
        return unicodeScalars.reduce(5381) {
            ($0 << 5) &+ $0 &+ Int($1)
        }
    }
}

class Node {
    var key: Key
    var value: Int
    var left: Node?
    var right: Node?
    
    init(key:Key,value:Int){
        self.key = key
        self.value = value
    }
    
}


class Dictionary{
    var main: Node?
    
//    init(key: String, value: Int){
//        self.main = (Node(key: Key(key),value: value))
//    }
    
    func show(node: Node? = nil) {
        
        if let unwrapNode = node {
            print(unwrapNode.value)
            
            if let nodeLeft = unwrapNode.left {
                show(node: nodeLeft)
            }
            if let nodeRight = unwrapNode.right {
                show(node: nodeRight)
            }
        }
        else if main != nil {
            show(node: main)
        }
    }
    
    func deleteAll(){
        guard let main = self.main else { return }
        main.left = nil
        main.right = nil
    }
    
    func append(key: Key,value: Int){
        
        guard let main = self.main else {
            self.main = Node(key: key,value: value)
            return
        }
        
        var node: Node? = main
        let nodeToAdd = Node(key: key,value: value)
        
        while node != nil {
            if node!.key.hashCode() > nodeToAdd.key.hashCode() {
                guard let tempNode = node?.left else {
                    node?.left = nodeToAdd
                    break
                }
                node = tempNode
            }
            else {
                guard let tempNode = node?.right else {
                    node?.right = nodeToAdd
                    break
                }
                node = tempNode
            }
        }
    }
    
    func get(key:Key){
//        var node: Node? = main
        guard var node = main else { return }
        while node.key.hashCode() != key.hashCode() {
            if node.key.hashCode() > key.hashCode() {
                guard let tempNode = node.left else {
                    print("nothing")
                    break
                }
                node = tempNode
            }
            else {
                guard let tempNode = node.right else {
                    print("nothing")
                    break
                }
                node = tempNode
            }
        }
        if node.key.hashCode() == key.hashCode() {
            print( node.value )
        }
    }
    
    private func delete(node: Node){
        
        if let nodeLeft = node.left {
            delete(node: nodeLeft)
            append(key: nodeLeft.key,value: nodeLeft.value)
        }
        if let nodeRight = node.right {
            delete(node: nodeRight)
            append(key: nodeRight.key,value: nodeRight.value)
        }
        
    }
    
    func deleteNode(key: Key, node: Node? = nil) {
        guard let main = self.main else { return }
        guard let node = node else {
            deleteNode(key: key,node: main)
            return
        }
        if node.key.hashCode() == key.hashCode() {
            let node = main
            self.main = nil
            delete(node: node)
        }
        else if let nodeLeft = node.left, nodeLeft.key.hashCode() == key.hashCode() {
            node.left = nil
            delete(node: nodeLeft)
        }
        else if let nodeRight = node.right, nodeRight.key.hashCode() == key.hashCode() {
            node.right = nil
            delete(node: nodeRight)
        }
    }
}

var dictionary = Dictionary()
dictionary.append(key: Key("0"),value: 0)
dictionary.append(key: Key("3"),value: 3)
dictionary.append(key: Key("9"),value: 9)
dictionary.append(key: Key("11"),value: 11)
dictionary.append(key: Key("4"),value: 4)
dictionary.append(key: Key("8"),value: 8)
dictionary.append(key: Key("13"),value: 13)
dictionary.append(key: Key("14"),value: 14)
dictionary.append(key: Key("1"),value: 1)
dictionary.append(key: Key("2"),value: 2)
dictionary.append(key: Key("12"),value: 12)
dictionary.append(key: Key("5"),value: 5)
dictionary.append(key: Key("6"),value: 6)
dictionary.append(key: Key("7"),value: 7)
//dictionary.get(key: Key("12"))
//dictionary.deleteNode(key: Key("3"))
//dictionary.deleteNode(key: Key("0"))
//dictionary.deleteNode(key: Key("2"))
dictionary.deleteNode(key: Key("0"))

dictionary.show()

