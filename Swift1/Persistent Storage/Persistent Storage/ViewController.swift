//
//  ViewController.swift
//  Persistent Storage
//
//  Created by Joe Lucero on 1/9/15.
//  Copyright (c) 2015 Joe Lucero. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
//        NSUserDefaults.standardUserDefaults().setObject("Joe", forKey: "myName")
//        
//        NSUserDefaults.standardUserDefaults().synchronize()
        
        println(NSUserDefaults.standardUserDefaults().objectForKey("myName")!)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

