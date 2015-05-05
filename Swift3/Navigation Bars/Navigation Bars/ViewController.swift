//
//  ViewController.swift
//  Navigation Bars
//
//  Created by Joe Lucero on 4/10/15.
//  Copyright (c) 2015 Joe Lucero. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var timer = NSTimer()
    var count = 0.00

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        timer = NSTimer.scheduledTimerWithTimeInterval(0.01, target: self, selector: Selector("result"), userInfo: nil, repeats: true)
        
    }
    
    func result(){
        count = count + 0.01
        println(count)
    }


}

