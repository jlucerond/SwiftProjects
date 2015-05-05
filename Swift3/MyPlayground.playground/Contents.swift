//: Playground - noun: a place where people can play

import UIKit

/*
var str = "Hello"
let name = "Joe"

var newString = str + " Joe"
var otherWay = str + " " + name


for x in newString{
    println(x)
}

var newNewString = NSString(string: newString)

newNewString.substringToIndex(5)
newNewString.substringFromIndex(6)
newNewString.substringWithRange(NSRange(location: 4, length: 3))

if newNewString.containsString("Joe"){
    println("hey joe")
}

newNewString.componentsSeparatedByString(" ")

newNewString.uppercaseString

newNewString.lowercaseString

*/

var number = 33451111
var divisor = 2
var isPrime = true

for var x = 2; x*x <= number; x++ {
    if isPrime{
        if number % divisor == 0 {
                isPrime = false
        }
        else{
            divisor++
        }
    }
}

if isPrime{
    "prime number"
}

else{
    "composite- divisible by \(divisor)"
}