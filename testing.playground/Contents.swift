import UIKit
import Darwin.C.math


func arithmeticAverage(numbers: Double...) -> Double{
    var total : Double = 0
    
    for number in numbers {
        total += number
    }

    return total / Double(numbers.count);
}


func geometricMean(numbers: Double...) -> Double?{
    var total : Double = 1

    for number in numbers {
        total *= number
    }
    
    if (total <= 0){
        return (nil)
    }
    return pow(total, 1.0 / Double(numbers.count))
}


func quadraticEquation(a:Double,b:Double,c:Double) -> (Double?,Double?){
    let discriminant = b*b - 4*a*c;
    if (discriminant <= 0){
        return (nil,nil)
    }
    let x1 = ( -b + discriminant.squareRoot() ) / 2;
    let x2 = ( -b - discriminant.squareRoot() ) / 2;
    
    return (x1,x2)
}

