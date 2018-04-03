import Cocoa
import Foundation

let sort = Sorter()
let dictionary: Dictionary = [
     "1"  :  Array<Int>.makeList(count: 1000, range: 999)//.sorted()//{ $0 > $1 }
    ,"2"  :  Array<Int>.makeList(count: 2000, range: 999)//.sorted()//{ $0 > $1 }
    ,"4"  :  Array<Int>.makeList(count: 4000, range: 999)//.sorted()//{ $0 > $1 }
    ,"8"  :  Array<Int>.makeList(count: 8000, range: 999)//.sorted()//{ $0 > $1 }
    ,"16" :  Array<Int>.makeList(count: 16000,range: 999)//.sorted()//{ $0 > $1 }
]
sort.showResult(dictionary: dictionary)

