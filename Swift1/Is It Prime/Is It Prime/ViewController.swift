//
//  ViewController.swift
//  Is It Prime
//
//  Created by Joe Lucero on 1/8/15.
//  Copyright (c) 2015 Joe Lucero. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var numberInputByUser: UITextField!
    @IBOutlet var labelToNotifyUserOfPrimeness: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func buttonPushedByUser(sender: UIButton)
    {
        var x = numberInputByUser.text.toInt()
        labelToNotifyUserOfPrimeness.text = "Thinking..."
        
        if x == 1
        {
            labelToNotifyUserOfPrimeness.text = "One is neither composite nor prime"
        }
        
        else if x != nil && x <= 1000000 && x > 1
        {
            labelToNotifyUserOfPrimeness.text = "The number \(x!) is prime"

            for var i = 2; i < x; i++
            {
                if x! % i == 0
                {
                    labelToNotifyUserOfPrimeness.text = "The number \(x!) is NOT a prime number"
                }
            }
            
        }
        
        else
        {
            labelToNotifyUserOfPrimeness.text = "Pick an Integer between 1 and 1,000,000";
        }
    }

}

