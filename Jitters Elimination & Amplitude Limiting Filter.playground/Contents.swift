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

//Jitters Elimination & Amplitude Limiting Filter
//Filter10 Start
let E1=10
let E2=3
var count10=0
var Key=getTestValueInt()
//print("Key is:\(Key)")
func Filter10(inout value:Int)->Double{
    var temp=0
    let newValue=getTestValueInt()
    //print("New value is \(newValue)")
    if (newValue-temp>E1||temp-newValue>E1) {
        temp=value
    } else {
        temp=newValue
    }
    if value != newValue {
        count10+=1
    }
    if count10>E2 {
        count10=0//You must clear count other wise it won't change
        temp=newValue
    }
    value=temp
    //print("value is \(value)")
    return Double(value)
}
//Filter10 End
//Filter10 Test Start
for i in 0...5 {
    print(Filter10(&Key).format(".2"))
}
//Filter10 Test End
