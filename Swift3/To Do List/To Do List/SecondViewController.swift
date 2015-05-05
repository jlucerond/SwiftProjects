//
//  SecondViewController.swift
//  To Do List
//
//  Created by Joe Lucero on 4/13/15.
//  Copyright (c) 2015 iOSDevelopr. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet var textField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        textField.delegate = self
    }


    @IBAction func addItemButtonPressed(sender: AnyObject) {
        toDoList.append(self.textField.text)
        textField.text = ""
        self.textField.resignFirstResponder()
        NSUserDefaults.standardUserDefaults().setObject(toDoList, forKey: "toDoList")
    }
    
    func textFieldShouldReturn(textField : UITextField) -> Bool {
        addItemButtonPressed(self)
        return true
    }
    
    //tap outside of the keyboard and the keyboard dismisses itself
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        self.textField.resignFirstResponder()
    }


}

