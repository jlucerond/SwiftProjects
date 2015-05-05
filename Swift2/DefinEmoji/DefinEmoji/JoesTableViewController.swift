//
//  JoesTableViewController.swift
//  DefinEmoji
//
//  Created by Joe Lucero on 3/20/15.
//  Copyright (c) 2015 Joe Lucero. All rights reserved.
//

import UIKit

class JoesTableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet var joesTableView: UITableView!
    
    var emojiArray = ["😄", "😔", "😎", "👽", "💩"]
    var emojiDefinitions = ["happy", "sad", "cool", "alien", "poop"]
    var selectedEmoji : String = ""
    var selectedDefinition = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        joesTableView.dataSource = self
        joesTableView.delegate = self
        
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return emojiArray.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = UITableViewCell()
        cell.textLabel?.text = emojiArray[indexPath.row] + " " + emojiDefinitions[indexPath.row]
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        var numberInArray = indexPath.row
        selectedEmoji = emojiArray[numberInArray]
        selectedDefinition = emojiDefinitions[numberInArray]
        performSegueWithIdentifier("showMeMyEmoji", sender: self)
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        var myPrepareForSegueViewController = segue.destinationViewController as! DetailViewController
        myPrepareForSegueViewController.emojiThatNeedsToTransfer = selectedEmoji
        myPrepareForSegueViewController.emojiDefinitionThatNeedsToTransfer = selectedDefinition
    }

}
