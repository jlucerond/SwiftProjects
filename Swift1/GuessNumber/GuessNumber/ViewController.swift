//
//  ViewController.swift
//  GuessNumber
//
//  Created by Joe Lucero on 1/6/15.
//  Copyright (c) 2015 Joe Lucero. All rights reserved.
//

import UIKit


var randomNumber = Int(arc4random_uniform(5) + 1)

class ViewController: UIViewController {
    @IBOutlet var numberTextField: UITextField!
    @IBOutlet var amIRight: UILabel!
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        
    }
    
    
    
    @IBAction func guessNumber(sender: AnyObject)
    {
        var userNumber = numberTextField.text.toInt()
        
        if userNumber != nil {
        
            if userNumber < 1 || userNumber > 5
            {
                amIRight.text = "Pick a number between 1 and 5"
            }
            
            else if userNumber < randomNumber
            {
                amIRight.text = "too small"
            }
            
            else if userNumber > randomNumber
            {
                amIRight.text = "too big"
            }
            
            else
            {
                amIRight.text = "nice!"
            }
            
        }
        
        else
        {
            amIRight.text = "don't be a jerk"
        }
        
        
    }
    
    @IBAction func newNumber(sender: AnyObject)
    {
        randomNumber = Int(arc4random_uniform(5)+1)
        println("\(randomNumber)")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

