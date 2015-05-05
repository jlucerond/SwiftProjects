// Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

//NSUserDefaults.standardUserDefaults().setObject("Joe", forKey: "myName")
//
//NSUserDefaults.standardUserDefaults().synchronize()

println(NSUserDefaults.standardUserDefaults().objectForKey("myName")!)
