//
//  FirstViewController.swift
//  To Do List
//
//  Created by Joe Lucero on 4/13/15.
//  Copyright (c) 2015 iOSDevelopr. All rights reserved.
//

import UIKit

var toDoList = [String]()

class FirstViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    //things
    @IBOutlet var tableView: UITableView!
    
    
    //actions
    override func viewDidLoad() {
        super.viewDidLoad()
        // Crikey Mate
        
        if NSUserDefaults.standardUserDefaults().objectForKey("toDoList")  != nil {
            toDoList = NSUserDefaults.standardUserDefaults().objectForKey("toDoList") as! [String]
        }
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return toDoList.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = UITableViewCell()
        cell.textLabel?.text = toDoList[indexPath.row]
        return cell
    }
    
    override func viewDidAppear(animated: Bool) {
        tableView.reloadData()
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        
        if editingStyle == UITableViewCellEditingStyle.Delete {
            toDoList.removeAtIndex(indexPath.row)
            
            NSUserDefaults.standardUserDefaults().setObject(toDoList, forKey: "toDoList")
            
            tableView.reloadData()
        }
        
    }

}

