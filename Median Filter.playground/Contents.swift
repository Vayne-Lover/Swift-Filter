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
//Median Filter
//Filter2 Start
var Value2=128.0
func filter2(inout Value:Double)->Double{
    var value2:[Int]=[getTestValueInt(),getTestValueInt(),getTestValueInt(),getTestValueInt()]
    for i in 0..<3 {
        for j in 0..<3-i {
            if value2[j]>value2[j+1] {
                let temp=value2[j]
                value2[j]=value2[j+1]
                value2[j+1]=temp
            }
        }
    }
    Value=Double(value2[2]+value2[1])/2.0
    return Value
}
//Filter2 End
//Filter2 Test Start
print(filter2(&Value2).format(".2"))
//Filter2 Test End
