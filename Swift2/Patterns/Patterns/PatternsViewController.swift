//
//  ViewController.swift
//  Patterns
//
//  Created by Joe Lucero on 3/18/15.
//  Copyright (c) 2015 Joe Lucero. All rights reserved.
//

import UIKit
import CoreData

class PatternsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet var tableView: UITableView!
    
    var patterns : [Pattern] = []
    var selectedPattern : Pattern? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.tableView.dataSource = self
        self.tableView.delegate = self
        
//        createTestPatterns()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        // coding
        
        var context = (UIApplication.sharedApplication().delegate as AppDelegate).managedObjectContext!
        var request = NSFetchRequest(entityName: "Pattern")
        var results = context.executeFetchRequest(request, error: nil)
        
        if results != nil{
            patterns = results! as [Pattern]
        }
        
    }
    
    func createTestPatterns(){
        var context = (UIApplication.sharedApplication().delegate as AppDelegate).managedObjectContext!
        var pattern = NSEntityDescription.insertNewObjectForEntityForName("Pattern", inManagedObjectContext: context) as Pattern
        pattern.name = "pants"
        pattern.frontImage = UIImageJPEGRepresentation(UIImage(named: "original.jpg"), 1)
        pattern.backImage = UIImageJPEGRepresentation(UIImage(named: "question.jpg"), 1)
        context.save(nil)
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return patterns.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = UITableViewCell()
        var thisOnePattern = patterns[indexPath.row]
        
        cell.textLabel?.text = thisOnePattern.name
        
        if thisOnePattern.frontImage.length == 0{
            cell.imageView?.image = UIImage(named: "question.jpg")
            println("does this run")
        }
        
        else{
        cell.imageView?.image = UIImage(data: thisOnePattern.frontImage)
        }
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        selectedPattern = patterns[indexPath.row]
        performSegueWithIdentifier("patternDetailSegue", sender: self)
        viewWillAppear(true)

    }
    
    
    // ATTEMPT TO BE ABLE TO DELETE DATA FAILED
    /*
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == UITableViewCellEditingStyle.Delete{
            patterns.removeAtIndex(indexPath.row)
            
            let fixedPatterns = patterns
            NSUserDefaults.standardUserDefaults().setObject(fixedPatterns, forKey: "patterns")
            NSUserDefaults.standardUserDefaults().synchronize()
            
            tableView.reloadData()
        }
    }
    */
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {

        if segue.identifier == "patternDetailSegue"{
        var detailViewController = segue.destinationViewController as PatternDetailViewController
        detailViewController.pattern = selectedPattern
        }
    }


}

