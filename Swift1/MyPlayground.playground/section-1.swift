// Playground - noun: a place where people can play

import UIKit

//      FOR LOOPS
//for var i = 1; i <= 10; i++
//{
//    println(i*5)
//}
//
//var x = [10, 4, 9, 3]
//
//println(x)
//
//
////for viewing only
//for y in x
//{
//    println(y)
//}
//
////for maniuplating array
//for (index, y) in enumerate(x)
//{
//    x[index] = y + 1
//}
//
//println(x)
//


//var myArray = [50, 20, 35.0, 1]
//
//for (index, x) in enumerate(myArray)
//{
//    myArray[index] = x/2
//}
//
//    println(myArray)
//
//
//var i = 1
//
//while i <= 10
//    
//{
//    println(i*2)
//    i++
//}
//          WHILE LOOPS
//var mySecondArray = [2, 7, 13, 100]
//
//var index = 0
//
//while index < mySecondArray.count
//
//{
//    println(mySecondArray[index])
//    index++
//}
//
//var myThirdArray = [10, 53, -2, 12]
//
//var arrayCount = 0
//
//while arrayCount < myThirdArray.count
//{
//    myThirdArray[arrayCount] = myThirdArray[arrayCount] - 1
//    
//    arrayCount++
//}
//
//println(myThirdArray)

var z = 10.0

var x = sqrt(z);

var isPrime = true

for var i = 2.0; i < x; i++
{
    if z % i == 0
    {
        isPrime = false
        println("the number is divisible by \(i)")
    }
}

if isPrime == false
{
    println("your number is not prime")
}

else
{
    println("your number is prime")
}