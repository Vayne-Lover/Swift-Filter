//Setting Start
import UIKit
func getTestValueUInt16()->UInt16{
    return UInt16(arc4random_uniform(255))
}
func getTestValueInt()->Int{
    return Int(arc4random_uniform(255))
}
//Setting End

//Double Extension Start
extension Double{//If you want to format you can use the extension.
    func format(f:String) -> String {
        return NSString(format: "%\(f)f",self) as String
    }
}
//Double Extension End
//Extension Example Start
//print(Double(3.1415).format(".2"))//There is the example to format Double
//Extension Example End

//First Order Lag Filter
//Filter7 Start
let B=0.3
var Key=Double(getTestValueInt())
func Filter7(inout value:Double)->Double{
    let newValue=getTestValueInt()
    value = B*value+(1-B)*Double(newValue)
    return Double(value)
}
//Filter7 End
//Filter7 Test Start
print(Filter7(&Key).format(".2"))
//Filter7 Test End
