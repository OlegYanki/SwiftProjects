class Sort {

    func show(array: [Int] ) {
        for element in array {
            print(element)
        }
    }

    func bubble(array: [Int]) -> [Int] {
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

    func insert(array: [Int]) -> [Int] {
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

    func select(array: [Int]) -> [Int] {
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


    func quick(array: [Int], left: Int = 0,right: Int? = nil) -> [Int] {
        
        if var right = right {
            print(right)
        } else {
            var right = array.count-1
            print(right)
        }
        
        var arrayResult = array
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
        return arrayResult
    }

    func mergeSort(_ array: [Int]) -> [Int] {
        guard array.count > 1 else { return array }
        
        let middleIndex = array.count / 2
        
        let leftArray = mergeSort(Array(array[0..<middleIndex]))
        let rightArray = mergeSort(Array(array[middleIndex..<array.count]))
        
        return merge(leftArray, rightArray)
    }

    private func merge(_ left: [Int], _ right: [Int]) -> [Int] {
        //    print(left)
        //    print(right)
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
        
        //    print(orderedArray)
        //    print()
        return orderedArray
    }
}

//var array = [2,21,12,1,2,3,121,123,125,4,5,1,123,999]
//
//array = quick(array: array)
//show()

//var obj = Sort()
//obj.quick(array: [2,3,5,1,23,12])









