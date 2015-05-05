//
//  ViewController.swift
//  Times Tables
//
//  Created by Joe Lucero on 4/11/15.
//  Copyright (c) 2015 Joe Lucero. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet var tableView: UITableView!

    @IBOutlet var slider: UISlider!
    @IBOutlet var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func sliderValueChanged(sender: UISlider) {
        var currentValue = Int(sender.value)
        label.text = "\(currentValue)"
        tableView.reloadData()
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = UITableViewCell()

        var timesTable = Int(slider.value) * (indexPath.row + 1)
        
        cell.textLabel?.text = "\(timesTable)"
        return cell
        
        
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }


}

