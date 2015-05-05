//
//  ViewController.swift
//  Guess A Number!
//
//  Created by Joe Lucero on 4/9/15.
//  Copyright (c) 2015 Joe Lucero. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var userNumberField: UITextField!
    @IBOutlet var didUserGuessRightLabel: UILabel!
    @IBOutlet var newRandomNumber: UIButton!
    
    var computerNumber = Int(arc4random_uniform(6))

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func newRandomNumberPressed(sender: AnyObject) {
        
        computerNumber = Int(arc4random_uniform(6))
        userNumberField.text = ""
        didUserGuessRightLabel.text = ""
        newRandomNumber.hidden = true
        
    }


    @IBAction func guessButtonPressed(sender: AnyObject) {
        
        if userNumberField.hasText() {
            var humanNumber = userNumberField.text.toInt()!
            
            if humanNumber > 5 || humanNumber < 0{
                didUserGuessRightLabel.text = "Guess a number between 0 and 5"
            }
            
            else if humanNumber == computerNumber
            {
                didUserGuessRightLabel.text = "You won!"
                newRandomNumber.hidden = false
                
            }
            
            else if humanNumber < computerNumber
            {
                didUserGuessRightLabel.text = "Too low, guess again!"
            }
            
            else if humanNumber > computerNumber
            {
                didUserGuessRightLabel.text = "Too high, guess again!"
            }
            
        }
        
    }

}

