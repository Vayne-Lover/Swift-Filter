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

//Vayne-Lover Filter Start
var qualityRecorder:[Int]=[255,255,255,255,255,255]
func qualityUpdate<T>(inout num:[T]){
    for i in 0...(num.count-2){//The range is [0,count-2] because we use i+1
        num[i]=num[i+1]
    }
}
func qualityCalculate(num:[Int])->Double{
    let sum=num.reduce(0, combine:+)
    let maxNumber=num.reduce(0,combine: {max($0,$1)})//You should name different from max or min
    let minNumber=num.reduce(255, combine: {min($0, $1)})//The init value can't be zero
    return Double(sum-minNumber-maxNumber)/4.0
//    let newNum=num.sort(<)
//    var sumNumber=0
//    for i in 1...(newNum.count-2) {//Another way
//        sumNumber+=newNum[i]
//    }
//    return Double(sumNumber)/4.0
}
var qual:[Int]=[100,150,175,180]
for i in 0...3{
    qualityUpdate(&qualityRecorder)
    qualityRecorder[5]=qual[i]
    print(qualityCalculate(qualityRecorder).format(".2"))
}
//Vayne-Lover Filter End

//Jitters Elimination & Amplitude Limiting Filter
////Filter10 Start
//let E1=10
//let E2=3
//var count10=0
//var Key=getTestValueInt()
////print("Key is:\(Key)")
//func Filter10(inout value:Int)->Double{
//    var temp=0
//    let newValue=getTestValueInt()
//    //print("New value is \(newValue)")
//    if (newValue-temp>E1||temp-newValue>E1) {
//        temp=value
//    } else {
//        temp=newValue
//    }
//    if value != newValue {
//        count10+=1
//    }
//    if count10>E2 {
//        count10=0//You must clear count other wise it won't change
//        temp=newValue
//    }
//    value=temp
//    //print("value is \(value)")
//    return Double(value)
//}
////Filter10 End
////Filter10 Test Start
//for i in 0...5 {
//    print(Filter10(&Key))
//}
////Filter10 Test End

////Jitters Elimination Filter
////Filter9 Start
//let D=3
//var count9=0
//var Key=getTestValueInt()
//func Filter9(inout value:Int)->Double{
//    let newValue=getTestValueInt()
//        if value != newValue {
//            count9+=1
//        }
//        if count9>D {
//            value=newValue
//            count9=0
//        }
//    return Double(value)
//}
////Filter9 End
////Filter9 Test Start
//for i in 1...6{
//print(Filter9(&Key))
//}
////Filter9 Test End

////Weighted Mean Filter
////Filter8 Start
//var cofficient:[Double]=[1.1,0.3,1.5,0.7,2.3]
//let sumCofficient=cofficient.reduce(0.0, combine: +)
//var value8=Double(getTestValueInt())
//func Filter8(inout value:Double)->Double{
//    var newValue:[Double]=[0.0,0.0,0.0,0.0,0.0]
//    for i in 0...(newValue.count-1){
//        newValue[i]=Double(getTestValueInt())
//    }
//    print(newValue)
//    var sum = 0.0
//    for i in 0...(newValue.count-1){
//    sum+=newValue[i]*cofficient[i]
//    }
//    value=sum/sumCofficient//You don't need to divide newValue.count because we add part of each number
//    return Double(value)
//}
////Filter8 End
////Filter8 Test Start
//print(Filter8(&value8))
////Filter8 Test End

////First Order Lag Filter
////Filter7 Start
//let B=0.3
//var Key=Double(getTestValueInt())
//func Filter7(inout value:Double)->Double{
//    let newValue=getTestValueInt()
//    value = B*value+(1-B)*Double(newValue)
//    return Double(value)
//}
////Filter7 End
////Filter7 Test Start
//print(Filter7(&Key))
////Filter7 Test End

////Amplitude Limiting Average Filter
////Filter6 Start
//let A=10
//var value6 = [0,0,0,0,0]
//for i in 0...(value6.count-1){
//value6[i]=getTestValueInt()
//}
//func Filter6(value:[Int]) -> Double {
//    var newValue = value
//    var Key=newValue[0]
//    for i in 0...newValue.count-1 {
//        if (Key-newValue[i]>A)||(newValue[i]-Key>A){
//            newValue[i]=Key
//        }
//        Key=newValue[i]
//    }
//    return Double(newValue.reduce(0, combine: {$0 + $1}))/Double(newValue.count)
//}
////Filter6 End
////Filter6 Test Start
//print(Filter6(value6))
////Filter6 Test End

////Median Average Filter
////Filter5 Start
//var value5=[0,0,0,0,0,0]
//func Filter5(value:[Int])->Double{
//    var value0 = value
//    for i in 0...value0.count-1{
//        value0[i]=getTestValueInt()
//    }
//    var new=value0.sort(<)
//    var sum=0
//    for i in 1...new.count-2 {
//        sum+=new[i]
//    }
//    return Double(sum)/Double((new.count-2))//Get rid of the max and min in the array
//    //There you need to explicit cast Both Int to Double to ensure get the right answer
//}
////Filter5 End
////Filter5 Test Start
//print(Filter5(value5))
////Filter5 Test End

////Recursive Average Filter
////Filter4 Start
//var buff:[Int]=[255,255,255,255]
//func Update<T>(inout num:[T]){
//    for i in 0...2
//    {num[i]=num[i+1]}
//}
//func Filter4(num:[Int])->Double{
//    var sum:Int=num[0]
//    for i in 1...3
//    {
//        sum+=num[i]
//    }
//    return Double(sum)/4.0
//}
////Filter4 End
////Filter4 Test Start
//    var value=[100,150,200,250]
//    for i in 0...3{//Do four times to change value
//    Update(&buff)
//    buff[3]=value[i]
//    print(Filter4(buff))
//}
////Filter4 Test End

////Arithmetical Average Filter
////Filter3 Start
//var value3:Double=128
//func filter3(inout value:Double)->Double{
//    var sum = 0
//    var num:[Int]=[0,0,0]
//    for i in 0...2 {
//        num[i]=getTestValueInt()
//        sum+=num[i]
////        print(num[i]) //There you can verify the number
//    }
//    value3=Double(sum)/3.0
//    return value3
//}
////Filter3 End
////Filter3 Test Start
//print(filter3(&value3))
////Filter3 Test End

////Median Filter
////Filter2 Start
//var Value2=128.0
//func filter2(inout Value:Double)->Double{
//    var value2:[Int]=[getTestValueInt(),getTestValueInt(),getTestValueInt(),getTestValueInt()]
//    for i in 0..<3 {
//        for j in 0..<3-i {
//            if value2[j]>value2[j+1] {
//                let temp=value2[j]
//                value2[j]=value2[j+1]
//                value2[j+1]=temp
//            }
//        }
//    }
//    Value=Double(value2[2]+value2[1])/2.0
//    return Value
//}
////Filter2 End
////Filter2 Test Start
//print(filter2(&Value2))
////Filter2 Test End

////Amplitude Limiting Filter
////Filter1 Start
//let A=UInt16(10)
//var Value1:UInt16=128//You should chose middle of the value
//func filter1(inout Value1:UInt16)->Double{
//    let value=getTestValueUInt16()
//    //Value1 - value>=A//Take care.The type is UInt16，if false there will be error
//    if Value1>value{
//        if Value1 - value>A {
//            Value1=value}
//    }  else {
//        if value - Value1>A {
//            Value1=value}
//    }
//    return Double(Value1)
//}
////Filter1 End
////Filter1 Test Start
//print(filter1(&Value1))
////Filter1 Test End


