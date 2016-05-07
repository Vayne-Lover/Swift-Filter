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

//Median Average Filter
//Filter5 Start
var value5=[0,0,0,0,0,0]
func Filter5(value:[Int])->Double{
    var value0 = value
    for i in 0...value0.count-1{
        value0[i]=getTestValueInt()
    }
    var new=value0.sort(<)
    var sum=0
    for i in 1...new.count-2 {
        sum+=new[i]
    }
    return Double(sum)/Double((new.count-2))//Get rid of the max and min in the array
    //There you need to explicit cast Both Int to Double to ensure get the right answer
}
//Filter5 End
//Filter5 Test Start
print(Filter5(value5).format(".2"))
//Filter5 Test End