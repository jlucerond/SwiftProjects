//
//  ViewController.swift
//  Keyboard
//
//  Created by Joe Lucero on 4/13/15.
//  Copyright (c) 2015 iOSDevelopr. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet var textField: UITextField!
    @IBOutlet var label: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        textField.delegate = self
    }


    @IBAction func buttonPressed(sender: AnyObject) {
        label.text = textField.text
        textField.resignFirstResponder()
        
    }
    
    //user touches outside of app and keyboard closes
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        textField.resignFirstResponder()
    }
    
    //user hits return button, buttonPressed occurs, keyboard closes
    func textFieldShouldReturn(textField : UITextField) -> Bool {
        buttonPressed(self)
        println("happened")
        return true
    }

}

