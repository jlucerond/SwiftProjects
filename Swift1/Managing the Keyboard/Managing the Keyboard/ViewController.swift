//
//  ViewController.swift
//  Managing the Keyboard
//
//  Created by Joe Lucero on 1/9/15.
//  Copyright (c) 2015 Joe Lucero. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate{
    @IBOutlet var userText: UITextField!
    @IBOutlet var labelText: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent)
    {
        self.view.endEditing(true)
    }

    @IBAction func buttonPushed(sender: UIButton)
    {
        labelText.text = userText.text
        self.view.endEditing(true)
    
    }
    
//    func textFieldShouldReturn(textField: UITextField) -> Bool
//    {
//        textField.resignFirstResponder()
//        return true
//    }

}

