// Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

var anotherStr = "Joe"

var thirdStr = str + anotherStr

for Character in str{
    println(Character)
}

var newString = "Test StrinG" as NSString

var subString = (str as NSString).substringToIndex(4)

var endingString = (str as NSString).substringFromIndex(4)

var betweenString = (str as NSString).substringWithRange(NSRange(location: 2, length: 7))

if(
newString.containsString("g"))
{
    println("Yup, it says this")
}

else
{
    println("Nope.")
}

newString.componentsSeparatedByString(" ")

newString.uppercaseString

newString.lowercaseString

var lowerCaseString = newString.lowercaseString

newString.containsString("g")
(lowerCaseString as NSString).containsString("g")