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

//Recursive Average Filter
//Filter4 Start
var buff:[Int]=[255,255,255,255]
func Update<T>(inout num:[T]){
    for i in 0...2
    {num[i]=num[i+1]}
}
func Filter4(num:[Int])->Double{
    var sum:Int=num[0]
    for i in 1...3
    {
        sum+=num[i]
    }
    return Double(sum)/4.0
}
//Filter4 End
//Filter4 Test Start
    var value=[100,150,200,250]
    for i in 0...3{//Do four times to change value
    Update(&buff)
    buff[3]=value[i]
    print(Filter4(buff).format(".2"))
}
//Filter4 Test End
