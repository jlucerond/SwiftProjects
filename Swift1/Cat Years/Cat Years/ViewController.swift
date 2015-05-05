//
//  ViewController.swift
//  Cat Years
//
//  Created by Joe Lucero on 1/6/15.
//  Copyright (c) 2015 Joe Lucero. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var textField: UITextField!
    @IBOutlet var catAgeLabel: UILabel!
    
       override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func buttonPressed(sender: AnyObject) {
        
        var humanYears = textField.text?.toInt()
        
        if humanYears != nil && humanYears <= 40 {
            var catYears = humanYears! * 7
            catAgeLabel.text = "The cat is \(catYears) in cat years"
            
        }
        
        else{
            catAgeLabel.text = "Enter an age b/w 0-40"
        }
        
    }

}

