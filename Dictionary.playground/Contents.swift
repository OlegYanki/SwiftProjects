//: Playground - noun: a place where people can play

import UIKit

enum DictionaryError: Error {
    case absent
    case filled
    case outOfStock
}

class Dictionary<keyType: Equatable,valueType: Equatable>{
    var keyArray: Array<keyType> = []
    var valueArray: Array<valueType> = []
    
    init(){}
    
    func append(key:keyType,value:valueType) throws {
        var count = 0;
        
        while ( count < keyArray.count ) {
            if keyArray[count] == key {
                throw DictionaryError.filled
            }
            count += 1
        }
        keyArray.append(key)
        valueArray.append(value)
    }
    
    func delete(key:keyType)  {
        var count = 0;
        
        while(count < keyArray.count) {
            if keyArray[count] == key {
                keyArray.remove(at: count)
                valueArray.remove(at: count)
            }
            count += 1
        }

    }
    
    func get(key:keyType) throws -> valueType {
        var count = 0
        
        while(count < keyArray.count) {
            if keyArray[count] == key {
                return valueArray[count]
            }
            count += 1
        }
        print(1)
        throw DictionaryError.absent

    }
    
    func show(){
        if keyArray.count < 1 { return }
        
        for count in 0 ... keyArray.count-1 {
            print("\(keyArray[count]) : \(valueArray[count])")
        }
    }
    
    
}

var dic = Dictionary<String,Int>();
try dic.append(key: "first",value: 1)
try dic.append(key: "second",value: 2)
try dic.append(key: "third",value: 3)
do {
    try dic.append(key: "second",value: 3)
    try dic.get(key: "second1")
} catch DictionaryError.absent {
    print(DictionaryError.absent)
} catch DictionaryError.filled {
    print(DictionaryError.filled)
} catch {
    print("Error")
}

try dic.append(key: "four",value: 4)
try dic.append(key: "fife",value: 5)
try dic.append(key: "six",value: 6)


dic.show()

