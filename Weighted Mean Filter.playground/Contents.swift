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

//Weighted Mean Filter
//Filter8 Start
var cofficient:[Double]=[1.1,0.3,1.5,0.7,2.3]
let sumCofficient=cofficient.reduce(0.0, combine: +)
var value8=Double(getTestValueInt())
func Filter8(inout value:Double)->Double{
    var newValue:[Double]=[0.0,0.0,0.0,0.0,0.0]
    for i in 0...(newValue.count-1){
        newValue[i]=Double(getTestValueInt())
    }
    print(newValue)
    var sum = 0.0
    for i in 0...(newValue.count-1){
    sum+=newValue[i]*cofficient[i]
    }
    value=sum/sumCofficient//You don't need to divide newValue.count because we add part of each number
    return Double(value)
}
//Filter8 End
//Filter8 Test Start
print(Filter8(&value8).format(".2"))
//Filter8 Test End
