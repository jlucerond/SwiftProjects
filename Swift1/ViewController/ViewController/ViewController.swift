//
//  ViewController.swift
//  ViewController
//
//  Created by Joe Lucero on 1/9/15.
//  Copyright (c) 2015 Joe Lucero. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate {
    
    let array = ["A", "B", "C", "H"]
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return array.count
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "cell")
        
        cell.textLabel?.text = array[indexPath.row]
        
        return cell
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

