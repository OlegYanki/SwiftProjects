import Foundation


struct Complex: CustomStringConvertible {
    var ir: Double = 0
    var normal: Double = 0
    
    
    static func -(left: Complex, right: Complex) -> Complex {
        var numRes = Complex(ir:0,normal:0)
        
        numRes.ir = left.ir - right.ir
        numRes.normal = left.normal - right.normal
        
        return numRes
    }
    
    static func *(left: Complex, right: Complex) -> Complex {
        var numRes = Complex(ir:0,normal:0)
        
        numRes.ir = left.ir * right.ir - left.normal * right.normal
        numRes.ir = left.ir * right.normal + right.ir * left.normal
        
        return numRes
    }
    
     static func +(left: Complex, right: Complex) -> Complex {
        var numRes = Complex(ir:0,normal:0)
        
        numRes.ir = left.ir + right.ir
        numRes.normal = left.normal + right.normal
        
        return numRes
    }
    
    static func /(left: Complex, right: Complex) -> Complex {
        var numRes = Complex(ir:0,normal:0)

        numRes.normal = ( left.normal * right.normal + left.ir * right.ir )   /   ( pow(right.normal,2) + pow(right.ir,2) )

        numRes.ir = ( left.ir * right.normal - left.normal * right.ir )   /   ( pow(left.normal,2) + pow(right.ir,2) )
        
        return numRes
    }
    
    public var description: String { return "\(normal) + \(ir)i" }

}

var num1 = Complex(ir:5,normal:3)
var num2 = Complex(ir:3,normal:3)
var num3 = Complex()

num3 = num1 / num2

print(num3)


