//
//  SecondViewController.swift
//  To Do List
//
//  Created by Joe Lucero on 1/13/15.
//  Copyright (c) 2015 Joe Lucero. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UITextFieldDelegate {
    //variables
    @IBOutlet var toDoItem: UITextField!

    //functions
    @IBAction func addItem(sender: AnyObject)
    {
        toDoItems.append(toDoItem.text)
        
//        let fixedToDoItems = toDoItems
        NSUserDefaults.standardUserDefaults().setObject(toDoItems, forKey: "toDoItems")
        NSUserDefaults.standardUserDefaults().synchronize()
        
        self.view.endEditing(true)
    }
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //when user hits return, hit button and drop keyboard
    func textFieldShouldReturn(textField: UITextField) -> Bool
    {
        self.addItem(toDoItem.text)
        textField.resignFirstResponder()
        return true
    }
    
    //when user touches outside text field, the keyboard drops
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent)
    {
        self.view.endEditing(true)
    }


}

