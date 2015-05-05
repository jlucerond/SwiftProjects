//
//  FirstViewController.swift
//  To Do List
//
//  Created by Joe Lucero on 1/13/15.
//  Copyright (c) 2015 Joe Lucero. All rights reserved.
//

import UIKit

 var toDoItems:[String] = []

class FirstViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    //if mistake, change ! to ?
    @IBOutlet var tasksTable:UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return toDoItems.count
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        var cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "Anything")
        
        cell.textLabel?.text = toDoItems[indexPath.row]
        
        return cell
    }
    
    override func viewWillAppear(animated: Bool) {
        
        if var storedtoDoItems: AnyObject = NSUserDefaults.standardUserDefaults().objectForKey("toDoItems")
        {
            toDoItems = []
            
            for var i = 0; i < storedtoDoItems.count; ++i
            {
                toDoItems.append(storedtoDoItems[i] as NSString)
            }
        }
        
        tasksTable.reloadData()
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath)
    {
        if (editingStyle == UITableViewCellEditingStyle.Delete)
        {
            toDoItems.removeAtIndex(indexPath.row)
            
            let fixedToDoItems = toDoItems
            NSUserDefaults.standardUserDefaults().setObject(fixedToDoItems, forKey: "toDoItems")
            NSUserDefaults.standardUserDefaults().synchronize()
            
            tasksTable.reloadData()
        }
    }
}

