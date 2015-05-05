//
//  OnlyPageViewController.swift
//  Cat Years
//
//  Created by Joe Lucero on 4/9/15.
//  Copyright (c) 2015 Joe Lucero. All rights reserved.
//

import UIKit

class OnlyPageViewController: UIViewController {

    @IBOutlet var textField: UITextField!
    @IBOutlet var catAgeLabel: UILabel!
    @IBOutlet var catImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Let's go
    }


    @IBAction func findAgeButtonPressed(sender: AnyObject) {
    
        if textField.hasText() == true{
            
            var humanAge = textField.text.toInt()!
            var catAge  = humanAge*7
        
        
            catAgeLabel.text = "Your cat is \(catAge) in cat years"
        }
        
        else{
            catAgeLabel.text = "Enter a value"
        }
        
        textField.resignFirstResponder()
        catImage.image = UIImage(named: "cat.png")
    
    }

}

