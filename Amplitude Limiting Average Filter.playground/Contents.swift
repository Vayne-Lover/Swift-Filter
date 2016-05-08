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

//Amplitude Limiting Average Filter
//Filter6 Start
let A=10
var value6 = [0,0,0,0,0]
for i in 0...(value6.count-1){
value6[i]=getTestValueInt()
}
func Filter6(value:[Int]) -> Double {
    var newValue = value
    var Key=newValue[0]
    for i in 0...newValue.count-1 {
        if (Key-newValue[i]>A)||(newValue[i]-Key>A){
            newValue[i]=Key
        }
        Key=newValue[i]
    }
    return Double(newValue.reduce(0, combine: {$0 + $1}))/Double(newValue.count)
}
//Filter6 End
//Filter6 Test Start
print(Filter6(value6).format(".2"))
//Filter6 Test End