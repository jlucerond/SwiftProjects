//
//  ViewController.swift
//  Is It Prime
//
//  Created by Joe Lucero on 4/10/15.
//  Copyright (c) 2015 Joe Lucero. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // things
    @IBOutlet var yesOrNoLabel: UILabel!
    @IBOutlet var textField: UITextField!
    
    
    //actions
    override func viewDidLoad() {
        super.viewDidLoad()
        // View will load and then...
        
    }

    @IBAction func buttonPressed(sender: AnyObject) {
        // When the user presses a button, what will happen is...
        
        if textField.text.isEmpty {
            //check to make sure there's a number in the text field
            yesOrNoLabel.text = "enter a number"
        }
        
        else {
            //now check if the number is prime
            var number = textField.text.toInt()!
            
            var x = 2
            var isPrime = true
            
            while number > x*x && isPrime == true {
                
                if (number%x == 0){
                    isPrime = false
                }
                
                x++
            }
            

            if number == 1 {
                yesOrNoLabel.text = "one is neither prime nor composite"
            }
                
            else if number < 1 {
                yesOrNoLabel.text = "pick a number between 1 and 1,000,000"
            }
                
            else if    isPrime == true {
                yesOrNoLabel.text = "prime"
            }
                
            else {
                yesOrNoLabel.text = "composite"
            }
        }
        
    }

}

