//
//  ViewController.swift
//  Example App
//
//  Created by Joe Lucero on 1/5/15.
//  Copyright (c) 2015 Joe Lucero. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var myLabel: UILabel!
    @IBOutlet var myButton: UIButton!

    @IBAction func buttonPressed(sender: AnyObject) {
        println("hello world")
        myLabel.text = "it worked"

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

