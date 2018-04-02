indirect enum List<T> {
    case end
    case next(List<T>, T?)
    
    func isEmpty() -> Bool {
        switch self {
        case .end:
            return true
            
        default:
            return false
        }
    }
    
    mutating func insert(val : T) {

        var temp = self
        var stop = false
        while !stop {
            switch temp {
            case .end:
                var new = List.next(.end,val)
                self  = .next(new,val)
                stop = true
            case .next(var next, var value):
                print(value)
                var new = List.next(.end,val)
                self  = .next(new,val)
                stop = true
                temp = next
            }
        }
    }
    
    func printAll() {
        var temp = self
        while true {
            switch temp {
            case .end:
                print("end")
                return
            case .next(var next, var value):
                print(value)
                temp = next
            }
        }
    }
    
    mutating func push(item: T) {
        self = .next( self, item)
    }
    
    mutating func delete(){
        
    }
}

var a = List<Int>.end
//a.push(item: 1)
//a.push(item: 5)
//a.push(item: 6)

a.insert(val: 4)
a.insert(val: 5)
a.insert(val: 6)
a.printAll()
//print(a)




