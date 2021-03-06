import UIKit
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

//Amplitude Limiting Filter
//Filter1 Start
let A=UInt16(10)
var Value1:UInt16=128//You should chose middle of the value
func filter1(inout Value1:UInt16)->Double{
    let value=getTestValueUInt16()
    //Value1 - value>=A//Take care.The type is UInt16，if false there will be error
    if Value1>value{
        if Value1 - value>A {
            Value1=value}
    }  else {
        if value - Value1>A {
            Value1=value}
    }
    return Double(Value1)
}
//Filter1 End
//Filter1 Test Start
print(filter1(&Value1).format(".2"))
//Filter1 Test End
