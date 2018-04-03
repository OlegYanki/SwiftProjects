import Cocoa
import Foundation


final class Sorter {
    
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
        guard array.count > 1 else { return array }
        
        var arrayResult = array
        
        for i in 0 ..< arrayResult.count - 1 {
            
            var lowest = i
            for y in i + 1 ..< arrayResult.count {
                if arrayResult[y] < arrayResult[lowest] {
                    lowest = y
                }
            }
            
            if i != lowest {
                arrayResult.swapAt(i, lowest)
            }
        }
        return arrayResult
    }


    func quickSort(array: [Int], left: Int = 0,right: Int? = nil) -> [Int] {

//        if let right = right {
//
//        } else {
//            let right = array.count-1
//        }

        let right = right ?? array.count-1

                var arrayResult = array
                        var m = left
                        var k = right
                        let center = ( arrayResult[(m+k) / 2] )
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
    
    func timeSort(typeSort: typeSort, array: [Int]) -> Double {
        let sorter = Sorter()
        switch typeSort {
        case .quick:
            let now = Date()
            let _ = sorter.quickSort(array: array)
            return -now.timeIntervalSinceNow
        case .bubble:
            let now = Date()
            let _ = sorter.bubbleSort(array: array)
            return -now.timeIntervalSinceNow
        case .insert:
            let now = Date()
            let _ = sorter.insertSort(array: array)
            return -now.timeIntervalSinceNow
        case .select:
            let now = Date()
            let _ = sorter.selectSort(array: array)
            return -now.timeIntervalSinceNow
        case .merge:
            let now = Date()
            let _ = sorter.mergeSort(array: array)
            return -now.timeIntervalSinceNow
        }
    }
    
    func averageTime(typeSort: typeSort, repetition: Int, array: [Int]) -> Double {
        var sum = 0.0
        for _ in 0...repetition {
            sum += timeSort(typeSort: typeSort, array: array)
        }
        return sum / Double(repetition)
    }
    
    func showResult(dictionary:Dictionary<String,[Int]>) {
        var quickAvarageTime = 0.0
        var bubbleAvarageTime = 0.0
        var insertAvarageTime = 0.0
        var selectAvarageTime = 0.0
        var mergeAvarageTime = 0.0

        for item in dictionary {

            let quickTime = averageTime(typeSort: typeSort.quick, repetition: 5, array: item.value)
            quickAvarageTime += quickTime
            print("QUICK.  Time : \(quickTime), Array : \(item.value.count)")
            
            let bubbleTime = averageTime(typeSort: typeSort.bubble, repetition: 5, array: item.value)
            bubbleAvarageTime += bubbleTime
            print("BUBBLE. Time : \(bubbleTime), Array : \(item.value.count)")
            
            let insertTime = averageTime(typeSort: typeSort.insert, repetition: 5, array: item.value)
            insertAvarageTime += insertTime
            print("INSERT. Time : \(insertTime), Array : \(item.value.count)")
            
            let selectTime = averageTime(typeSort: typeSort.quick, repetition: 5, array: item.value)
            selectAvarageTime += selectTime
            print("SELECT. Time : \(selectTime), Array : \(item.value.count)")
            
            let mergeTime = averageTime(typeSort: typeSort.merge, repetition: 5, array: item.value)
            mergeAvarageTime += mergeTime
            print("MERGE.  Time : \(mergeTime), Array : \(item.value.count)")
            
            print()
        }
        print("QUICK_AVARAGE.   Time : \(quickAvarageTime  / Double(dictionary.count))")
        print("BUBBLE_AVARAGE.  Time : \(bubbleAvarageTime / Double(dictionary.count))")
        print("INSERT_AVARAGE.  Time : \(insertAvarageTime / Double(dictionary.count))")
        print("SELECT_AVARAGE.  Time : \(selectAvarageTime / Double(dictionary.count))")
        print("MERGE_AVARAGE.   Time : \(mergeAvarageTime  / Double(dictionary.count))")
    }
    
}

extension Array {
    
    static func makeList(count:Int, range: Int ) -> [Int] {
        var result:[Int] = []
        for _ in 0..<count {
            result.append(Int(arc4random_uniform(UInt32(range)) + 1))
        }
        return result
    }
}


