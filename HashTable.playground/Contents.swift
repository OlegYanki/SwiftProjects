struct Key: Hashable{
    
    var x: Int
    
    var hashValue: Int {
//        return Int((x.hashValue))
        return x
//        var result = UInt64 (5381)
//        let buf = [UInt8](str.utf8)
//        for b in buf {
//            result = 127 * (result & 0x00ffffffffffffff) + UInt64(b)
//        }
//        return result
//        return x.hashValue &* 16777619
    }
    
    init (_ x: Int){
        self.x = x
    }
    
    static func ==(lhs: Key, rhs: Key) -> Bool {
        return lhs.hashValue == rhs.hashValue
    }
}

enum DictionaryError: Error {
    case absent
    case filled
    case outOfStock
}

class HashTable<valueType: Equatable> {
    var valueArray: Array<valueType?> = [valueType?](repeating: nil, count: 1)
    
    init(){}
    
    func append(key:Key,value:valueType) throws {
        let hashValue = key.hashValue
        if valueArray.count < hashValue {
            valueArray = valueArray + [valueType?](repeating: nil, count: hashValue - valueArray.count )
            valueArray.insert(value,at:hashValue)
        }
        else if let _ = valueArray[hashValue]{
            throw DictionaryError.filled
        }
        else {
            valueArray.insert(value,at:hashValue)
        }
    }
    
    func delete(key:Key) {
        
        if let _ = valueArray[key.hashValue] {
            valueArray[key.hashValue] = nil
        }
        
    }
    
    func get(key:Key) throws -> valueType {
        
        if let value = valueArray[key.hashValue] {
            print( value )
            return value
        }
        throw DictionaryError.absent
        
    }
    
}

var table = HashTable<Int>();



do {
    var keyArray = [Key(111),Key(222),Key(333),Key(444),Key(555),Key(666)]
    
    try table.append(key: keyArray[0],value: 11111111)
    try table.append(key: keyArray[1],value: 22222222)
    try table.append(key: keyArray[2],value: 33333333)
    try table.append(key: keyArray[3],value: 44444444)
    try table.append(key: keyArray[4],value: 55555555)
    try table.append(key: keyArray[5],value: 66666666)
    try table.get(key: Key(333))
    
} catch DictionaryError.filled {
    print( DictionaryError.filled )
} catch DictionaryError.absent {
    print(DictionaryError.absent)
}





