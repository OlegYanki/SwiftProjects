import Cocoa
import Foundation

let sort = Sorter()
let dictionary: Dictionary = [
     "1"  :  Array<Int>.makeList(count: 10000, range: 999)//.sorted()//{ $0 > $1 }
    ,"2"  :  Array<Int>.makeList(count: 20000, range: 999)//.sorted()//{ $0 > $1 }
    ,"4"  :  Array<Int>.makeList(count: 40000, range: 999)//.sorted()//{ $0 > $1 }
    ,"8"  :  Array<Int>.makeList(count: 80000, range: 999)//.sorted()//{ $0 > $1 }
//    ,"16" :  Array<Int>.makeList(count: 160000,range: 999)//.sorted()//{ $0 > $1 }
]
sort.showResult(dictionary: dictionary)

