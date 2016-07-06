//
//  main.swift
//  firstSwift
//
//  Created by 吴青 on 16/4/9.
//  Copyright © 2016年 吴青. All rights reserved.
//

import Foundation

// 打印显示数据到屏幕
print("Hello, World!")

// 显示的定义一个字符串变量
var MyfirstVar : String = "It is nil?"



let mynum : Int = 67    // 显示的定义一个int型常量
let mystring  = "This is myString"  // 隐示的定义一个String型变量
let myNewString = mystring + String(mynum)      //  将字符串和整形拼接起来，数据类型转换需要显示转换
let myNewString2 = " my Int Value is \(mynum)"  // 类型的另一种转换
let myNewString3 = mystring + " My Int Value is "

print(myNewString)
print(myNewString2)
print(myNewString3);
print(" this is my string  what ?", mynum, " this is second ")



// 定义一个数组
var ThisMyList = ["what", " this", "sb", "OK?"]
print(ThisMyList)
print(ThisMyList[0]) //
ThisMyList = ["No","body"]
print(ThisMyList)
ThisMyList = ["吴青","是个","大帅比"]
// ThisMyList[4] = "帅的很"  //这里超内存了

print(ThisMyList)

var ThisMySecondList = [Int](count:100,repeatedValue:12)
ThisMySecondList[0] = 1
ThisMySecondList[2] = 2
ThisMySecondList[3] = 3
print(ThisMySecondList)

/*var ThisMyStringList = [String](count:100,repeatedValue:"")
ThisMySecondList[0] = "吴青"
ThisMySecondList[2] = "为什么"
ThisMySecondList[3] = "这么帅"
print(ThisMySecondList)*/


var myDictionary = [String:Int]()
myDictionary.updateValue(12, forKey: "I1")
var MyKey = "I1"

var myValue : String? = "111"

//myValue = myDictionary[MyKey]
print("1---------------------------")

print("\(myDictionary[MyKey])")




// 
let myForList = [28, 92, 10, 20,30]

var muAddNum = 0;

// for 循环  for (int nBegin = 0, nBegin < 100, ++nBegin)
for nBegin in 0 ..< 100{
        muAddNum+=1
}

for nBegin in myForList{
    if nBegin > 50{
        muAddNum += 1
    }
    else{
        muAddNum += 20
    }
}



var opetionalString :String? = "my name"
opetionalString = nil

if  opetionalString != nil{
    print("000000000000")
}
else{
    print("11111111111, \(opetionalString)")
}

var myStringSwtich:String = "吴青"
switch myStringSwtich{
case "diaobaole":
    var x = 1
    x+=1
    print("This is \(x)")
case "OK?":
    var x = 2
case "吴青":
    print("哈哈吴青就是帅")
default:
    var x = 4
}

print("2＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝")

// 嵌套map的读取打印
let  myMapListMap = [
    1:[ 100:"First", 200:"Second", 300:"Third"],
    2:[ 10:"First10", 20:"Second20", 30:"Third30"]
    
]


for (nFirst,nSecond) in myMapListMap {
    for (nThird, nFour) in nSecond {
        print("\(nThird)=\(nFour)")
    }
}


// 函数的实现调用
print("3===================")

func getNameAge( nName : String, nMayAge : Int , nThirdString:String) -> String {
    return " This Name = \(nName), nAge = \(nMayAge),n String = \(nThirdString)"
}

let szMyName = getNameAge ( "吴青" , nMayAge: 10,nThirdString: "3333")
print(szMyName)



// 多个返回值
print("4===========================")

func getMoreReturn(Score:[Int]) -> (nMin:Int, nMax:Int, nSum:Int){
    var nMin1 = Score[0]
    var nMax1 = Score[0]
    var nSum1 = Score[0]
    for nScore in Score {
        if nMin1 > nScore {
            nMin1 = nScore
        }
        if nMax1 < nScore {
            nMax1 = nScore
        }
        nSum1 += nScore
    }
    return (nMin1, nMax1, nSum1)
}



var nToalNum:[Int] = [10,20,44,34,45,45,22]
let nReturnMoreReturn = getMoreReturn(nToalNum)
print(nReturnMoreReturn)

//-----------------------------------------------
// 返回一个参数为Int型返回值为Int的函数
func makeIncrementer()->(Int -> Int) {
    func addOne(Number:Int)->Int{
        return 1 + Number
    }
    return addOne
}

// 这里实际上是取得 函数 addOne
var increment = makeIncrementer()

// 这里相当于调用 addOne
var x = increment(7)
x += 1
print("xxxx= \(x)")




//-----------------------------------------------
//将函数当作参数传给另一个函数
print("6=============================")

// 函数 FirtFUnc1 参数1:Int型数组，参数2:一个参数为Int型返回为Bool类型的函数
func FirtFunc1(inlist:[Int], inCondition: Int -> Bool ) -> Int{
    // 遍历传入的数组
    for item in inlist {
        // 将数组的值传入传入的函数
        if inCondition ( item){
            return item
        }
    }
    return  -1
}

func LessThanTen(number :Int) -> Bool{
    return number < 10
}

var nNumbers = [10,34,45,5,6,67,88, 22]

let nRetunNum = FirtFunc1(nNumbers , inCondition:LessThanTen)
print("less Than Ten = \(nRetunNum)")



//-----------------------------------------------
//  创建一个闭包
// 取数组nNumbers 中的函数map进行操作，结果存储道OutData中
// In后面的操作是匿名闭包的函数体
let OutData  = nNumbers.map({
    (number :Int)->Int in
   let result = 3 * number
    return result
})


print("-+-+-+-+\(OutData)")

// 将数据想家
var nOutData2 = OutData.map({ nNum in 1 + nNum })

print("-+-+-+-+\(nOutData2)")

// 当闭包作为一个参数传给一个函数时，它可以直接跟在括号后面, 下面两行代码是等价的
var nOutData4 =  nOutData2.sort({$0 > $1})
var nOutData3 =  nOutData2.sort(){$0 > $1}

print("-+-+-+-+\(nOutData3)")

//-----------------------------------------------
// 不定长参数的函数
print("5=====================")

func getMySum (numbers:Int ...) -> Int{
    var nSum = 0
    for nCur in numbers {
        nSum += nCur
    }
    return nSum
}

let nRturn = getMySum(1002,330,4,4,5,55,66,7,7)

print("all Sum = \(nRturn)")


//-----------------------------------------------
var xDataNum = [1, 3, 5, 7, 9, 11, 13, 15]

// 遍历传入的数组
for xxx1 in xDataNum {
    // 将数组的值传入传入的函数
    for xxx2 in xDataNum {
        for xxx3 in xDataNum{
            if (( xxx1 + xxx2 + xxx3)  == 35) && (xxx1 <= xxx2 ) && (xxx2 <= xxx3){
             
                print("\(xxx1) + \(xxx2) + \(xxx3)= 35")
                //break;
            }
        }
    }
}


//-----------------------------------------------
// 类的创建
// 类的所有成员变量必须初始化，有两种方式
// 1.在定义的时候初始化，
// 2.在Init中进行初始化，
// 3.类没有构造函数，如果要初/Users/wq/Documents/workPos/firstSwift/firstSwift/main.swift始化，重载 init ,析构函数为 deinit

class MyfirstSwiftClass{
    
    // 定义三个成员变量
    var m_nSecondMember : Int = 0       // 定义的时候就初始化了
    var m_nFirstMember : Int
    var m_sName : String
    
    // 重载init 初始化两个未初始化的成员变量
    init(sName : String, nMember : Int) {
        self.m_sName = sName                    // self 的功能用于区分传入参数名和成员参数
        self.m_nFirstMember = nMember
        
        
    }
    
    // 析构成员变量
    deinit {
        self.m_nFirstMember = 0
    }
    
    func getSimpleString() ->String{
        return "this is return base data "
    }
    
   
}


// 创建一个类 ，并且初始化数据 这里传入数据的时候，参数格式为  参数名:参数值
var t_myfirstclass = MyfirstSwiftClass(sName: "my class", nMember: 6)


// 创建一个类并且继承另一个类
class MyFirstChildClass : MyfirstSwiftClass{
    
    // 定义一个子类的成员变量
    var m_nChildMember : Int
    init( nChildMember : Int, sChildString:String){
        
        self.m_nChildMember = nChildMember          // 初始化子类的成员变量
        
        super.init(sName: sChildString, nMember: nChildMember) // 调用父类的成员初始化函数
        m_nChildMember += 7                                  // 可以直接调用成员变量直接赋值
        
    }
    
    func getAChildString() -> String{
        m_nChildMember += 1
        return "this is return child data"
    }
    
    // 重载父类的函数 需要用 override 标注重载函数
    override func getSimpleString() -> String {
        return "this is return child data e e e e e "
    }
}

//------------阅读到十二页











