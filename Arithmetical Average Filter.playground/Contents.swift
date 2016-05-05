//Setting Start
import UIKit
func getTestValueUInt16()->UInt16{
    return UInt16(arc4random_uniform(255))
}
func getTestValueInt()->Int{
    return Int(arc4random_uniform(255))
}
//Setting End

////Double Extension Start
extension Double{//If you want to format you can use the extension.
    func format(f:String) -> String {
        return NSString(format: "%\(f)f",self) as String
    }
}
////Double Extension End
////Extension Example Start
//print(Double(3.1415).format(".2"))//There is the example to format Double
////Extension Example End
//Arithmetical Average Filter
//Filter3 Start
var value3:Double=128
func filter3(inout value:Double)->Double{
    var sum = 0
    var num:[Int]=[0,0,0]
    for i in 0...2 {
        num[i]=getTestValueInt()
        sum+=num[i]
//        print(num[i]) //There you can verify the number
    }
    value3=Double(sum)/3.0
    return value3
}
//Filter3 End
//Filter3 Test Start
print(filter3(&value3).format(".2"))
//Filter3 Test End