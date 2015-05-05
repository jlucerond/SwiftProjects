//
//  ViewController.swift
//  Permanent Storage
//
//  Created by Joe Lucero on 4/13/15.
//  Copyright (c) 2015 iOSDevelopr. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
//        NSUserDefaults.standardUserDefaults().setObject("Joe", forKey: "name")
        
        var thing = NSUserDefaults.standardUserDefaults().objectForKey("name") as! String
        
        println(thing)
        
        NSUserDefaults.standardUserDefaults().setObject([1, 5, 7, 18], forKey: "myArray")
        
        var secondThing = NSUserDefaults.standardUserDefaults().objectForKey("myArray") as! NSArray
        
        println(secondThing[2])
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


}

