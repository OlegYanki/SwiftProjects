import Cocoa

final class Sorter {
    
    func makeList(count:Int, range: Int ) -> [Int] {
        var result:[Int] = []
        for _ in 0..<count {
            result.append(Int(arc4random_uniform(UInt32(range)) + 1))
        }
        return result//.sorted(<)
    }
    
    func bubbleSort(array: [Int]) -> [Int] {
        var arrayResult = array
        var temp: Int = 0
        for i in 0 ... arrayResult.count-1 {
            for j in i ... arrayResult.count-1 {
                if array[j] < arrayResult[i] {
                    temp = arrayResult[i]
                    arrayResult[i] = arrayResult[j]
                    arrayResult[j] = temp
                }
            }
        }
        return arrayResult
    }

    func insertSort(array: [Int]) -> [Int] {
        var arrayResult = array

        var key = 0
        var j = 0

        for i in 1 ... arrayResult.count-1 {
            key = arrayResult[i]
            j = i-1

            while j >= 0 && arrayResult[j] > key {
                arrayResult[j+1] = arrayResult[j]
                j = j-1
            }
            arrayResult[j+1] = key
        }
        return arrayResult
    }

    func selectSort(array: [Int]) -> [Int] {
        var arrayResult = array

        var temp = 0
        var indexMin = 0
        for i in 0 ... arrayResult.count-2 {
            indexMin = i+1
            for j in i ... arrayResult.count-1 {
                if arrayResult[j] < arrayResult[indexMin] {
                    indexMin = j
                }
                temp = arrayResult[i]
                arrayResult[i] = arrayResult[indexMin]
                arrayResult[indexMin] = temp
            }
        }
        return arrayResult
    }


    func quickSort(array: [Int], left: Int = 0,right: Int? = nil) -> [Int] {

//        if let right = right {

//        } else {
//            let right = array.count-1
//        }

        let right = right ?? array.count-1

                var arrayResult = array
                        var m = left
                        var k = right
                        let center = ( arrayResult[(m+k) / 2]  )
                        var buf = 0
                        repeat {
                            while arrayResult[m] < center { m += 1 }
                            while arrayResult[k] > center { k -= 1 }
                            if m <= k {
                                buf = arrayResult[m]
                                arrayResult[m] = arrayResult[k]
                                arrayResult[k] = buf
                                m += 1
                                k -= 1
                            }
                        } while m < k

                        if left < k {
                            arrayResult = quickSort( array: arrayResult, left: left,right: k )
                        }
                        if m < right {
                            arrayResult = quickSort( array: arrayResult, left: m,right: right )
                        }

        return arrayResult
    }

    func mergeSort( array: [Int]) -> [Int] {
        guard array.count > 1 else { return array }

        let middleIndex = array.count / 2

        let leftArray = mergeSort(array: Array(array[0..<middleIndex]))
        let rightArray = mergeSort(array: Array(array[middleIndex..<array.count]))

        return merge(leftArray, rightArray)
    }

    private func merge(_ left: [Int], _ right: [Int]) -> [Int] {
        
        var leftIndex = 0
        var rightIndex = 0

        var orderedArray: [Int] = []

        while leftIndex < left.count && rightIndex < right.count {
            let leftElement = left[leftIndex]
            let rightElement = right[rightIndex]

            if leftElement < rightElement {
                orderedArray.append(leftElement)
                leftIndex += 1
            } else if leftElement > rightElement {
                orderedArray.append(rightElement)
                rightIndex += 1
            } else {
                orderedArray.append(leftElement)
                leftIndex += 1
                orderedArray.append(rightElement)
                rightIndex += 1
            }
        }

        while leftIndex < left.count {
            orderedArray.append(left[leftIndex])
            leftIndex += 1
        }

        while rightIndex < right.count {
            orderedArray.append(right[rightIndex])
            rightIndex += 1
        }

        return orderedArray
    }
}

func timeSort(typeSort: typeSort, array: [Int]){
    let sorter = Sorter()
    switch typeSort {
    case .quick:
        let _ = sorter.quickSort(array: array)
    case .bubble:
        let _ = sorter.bubbleSort(array: array)
    case .insert:
        let _ = sorter.insertSort(array: array)
    case .select:
        let _ = sorter.selectSort(array: array)
    case .merge:
        let _ = sorter.mergeSort(array: array)
    }
}

//extension Array {
//    func bubble(array: [Int]) -> [Int] {
//        var arrayResult = array
//        var temp: Int = 0
//        for i in 0 ... arrayResult.count-1 {
//            for j in i ... arrayResult.count-1 {
//                if array[j] < arrayResult[i] {
//                    temp = arrayResult[i]
//                    arrayResult[i] = arrayResult[j]
//                    arrayResult[j] = temp
//                }
//            }
//        }
//        return arrayResult
//    }
//
//    func insert(array: [Int]) -> [Int] {
//        var arrayResult = array
//
//        var key = 0
//        var j = 0
//
//        for i in 1 ... arrayResult.count-1 {
//            key = arrayResult[i]
//            j = i-1
//
//            while j >= 0 && arrayResult[j] > key {
//                arrayResult[j+1] = arrayResult[j]
//                j = j-1
//            }
//            arrayResult[j+1] = key
//        }
//        return arrayResult
//    }
//
//    func select(array: [Int]) -> [Int] {
//        var arrayResult = array
//
//        var temp = 0
//        var indexMin = 0
//        for i in 0 ... arrayResult.count-2 {
//            indexMin = i+1
//            for j in i ... arrayResult.count-1 {
//                if arrayResult[j] < arrayResult[indexMin] {
//                    indexMin = j
//                }
//                temp = arrayResult[i]
//                arrayResult[i] = arrayResult[indexMin]
//                arrayResult[indexMin] = temp
//            }
//        }
//        return arrayResult
//    }
//
//
//    func quick(array: [Int], left: Int = 0,right: Int? = nil) -> [Int] {
//
//        //        if let right = right {
//
//        //        } else {
//        //            let right = array.count-1
//        //        }
//
//        let right = right ?? array.count-1
//
//        var arrayResult = array
//        var m = left
//        var k = right
//        let center = ( arrayResult[(m+k) / 2]  )
//        var buf = 0
//        repeat {
//            while arrayResult[m] < center { m += 1 }
//            while arrayResult[k] > center { k -= 1 }
//            if m <= k {
//                buf = arrayResult[m]
//                arrayResult[m] = arrayResult[k]
//                arrayResult[k] = buf
//                m += 1
//                k -= 1
//            }
//        } while m < k
//
//        if left < k {
//            arrayResult = quick( array: arrayResult, left: left,right: k )
//        }
//        if m < right {
//            arrayResult = quick( array: arrayResult, left: m,right: right )
//        }
//
//        return arrayResult
//    }
//
//    func mergeSort( array: [Int]) -> [Int] {
//        guard array.count > 1 else { return array }
//
//        let middleIndex = array.count / 2
//
//        let leftArray = mergeSort(array: Array<Int>(array[0..<middleIndex]))
//        let rightArray = mergeSort(array: Array<Int>(array[middleIndex..<array.count]))
//
//        return merge(leftArray, rightArray)
//    }
//
//    private func merge(_ left: [Int], _ right: [Int]) -> [Int] {
//        //    print(left)
//        //    print(right)
//        var leftIndex = 0
//        var rightIndex = 0
//
//        var orderedArray: [Int] = []
//
//        while leftIndex < left.count && rightIndex < right.count {
//            let leftElement = left[leftIndex]
//            let rightElement = right[rightIndex]
//
//            if leftElement < rightElement {
//                orderedArray.append(leftElement)
//                leftIndex += 1
//            } else if leftElement > rightElement {
//                orderedArray.append(rightElement)
//                rightIndex += 1
//            } else {
//                orderedArray.append(leftElement)
//                leftIndex += 1
//                orderedArray.append(rightElement)
//                rightIndex += 1
//            }
//        }
//
//        while leftIndex < left.count {
//            orderedArray.append(left[leftIndex])
//            leftIndex += 1
//        }
//
//        while rightIndex < right.count {
//            orderedArray.append(right[rightIndex])
//            rightIndex += 1
//        }
//
//        //    print(orderedArray)
//        //    print()
//        return orderedArray
//    }
//}









