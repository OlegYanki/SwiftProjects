var array = [2,21,12,1,2,3,121,123,125,4,5,1,123,999]
var key: Int = 0
var j: Int = 0

func show(){
    for element in array {
        print(element)
    }
}

func bubble() {
    var temp: Int = 0
    for i in 0 ... array.count-1 {
        for j in i ... array.count-1 {
            if array[j] < array[i] {
                temp = array[i]
                array[i] = array[j]
                array[j] = temp
            }
        }
    }
}

func insert(){
    var key = 0
    var j = 0
    
    for i in 1 ... array.count-1 {
        key = array[i]
        j = i-1
        
        while j > 0 && array[j] > key {
            array[j+1] = array[j]
            j = j-1
        }
        array[j+1] = key
    }
}

func select(){
    var temp = 0
    var indexMin = 0
    for i in 1 ... array.count-2 {
        indexMin = i+1
        for j in i ... array.count-1 {
            if array[j] < array[indexMin] {
                indexMin = j
            }
            temp = array[i]
            array[i] = array[indexMin]
            array[indexMin] = temp
        }
    }
}

func quick(left: Int = 0,right: Int = array.count-1){
    var m = left
    var k = right
    let center = ( array[(m+k) / 2]  )
    var buf = 0
    repeat {
        while array[m] < center { m += 1 }
        while array[k] > center { k -= 1 }
        if m <= k {
            buf = array[m]
            array[m] = array[k]
            array[k] = buf
            m += 1
            k -= 1
        }
    } while m < k
    
    if left < k {
        quick(left: left,right: k)
    }
    if m < right {
        quick(left: m,right: right)
    }
}

func mergeSort(_ array: [Int]) -> [Int] {
    guard array.count > 1 else { return array }
    
    let middleIndex = array.count / 2
    
    let leftArray = mergeSort(Array(array[0..<middleIndex]))
    let rightArray = mergeSort(Array(array[middleIndex..<array.count]))
    
    return merge(leftArray, rightArray)
}

func merge(_ left: [Int], _ right: [Int]) -> [Int] {
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

array = mergeSort(array)
//show()









