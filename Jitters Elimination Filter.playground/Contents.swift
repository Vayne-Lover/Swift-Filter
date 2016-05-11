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

//Jitters Elimination Filter
//Filter9 Start
let D=3
var count9=0
var Key=getTestValueInt()
func Filter9(inout value:Int)->Double{
    let newValue=getTestValueInt()
        if value != newValue {
            count9+=1
        }
        if count9>D {
            value=newValue
            count9=0
        }
    return Double(value)
}
//Filter9 End
//Filter9 Test Start
for i in 1...6{
print(Filter9(&Key).format(".2"))
}
//Filter9 Test End