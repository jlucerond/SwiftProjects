//
//  ViewController.swift
//  ExampleApp
//
//  Created by Joe Lucero on 4/9/15.
//  Copyright (c) 2015 Joe Lucero. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var userLabel: UILabel!
    @IBOutlet var userTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // View is Loaded
    
        
    }

    @IBAction func buttonPressed(sender: AnyObject) {
        
        self.userLabel.text = userTextField.text
        
        
    }

}

