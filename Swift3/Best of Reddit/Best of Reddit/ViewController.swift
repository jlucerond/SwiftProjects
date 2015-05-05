//
//  ViewController.swift
//  Best of Reddit
//
//  Created by Joe Lucero on 4/15/15.
//  Copyright (c) 2015 iOSDevelopr. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    //outlets & variables
    @IBOutlet var tableView: UITableView!
    var finalRedditArray : [String] = []
    var selectedRowText = ""
    
    //functions
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        var url = NSURL(string: "http://www.reddit.com")
        var task = NSURLSession.sharedSession().dataTaskWithURL(url!, completionHandler: { (redditData, response, error) -> Void in
            var allOfRedditContent = NSString(data: redditData, encoding: NSUTF8StringEncoding)!
            var redditArrayABCXYZ = allOfRedditContent.componentsSeparatedByString("tabindex=\"1\" >")
            
            for var i = 1; i <= 20; i++ {
                var redditArrayABC = redditArrayABCXYZ[i].componentsSeparatedByString("</a>")
                var redditString : String = redditArrayABC[0] as! String
                redditString = redditString.stringByReplacingOccurrencesOfString("&quot;", withString: "\"")
                self.finalRedditArray.append(redditString)
            }
            
            // I added this function to get the append to happen and then for the tableView to reload what's inside
            dispatch_async(dispatch_get_main_queue()){
                
                self.tableView.reloadData()
            }


        })
        
        task.resume()
        
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = UITableViewCell()
        cell.textLabel?.text = finalRedditArray[indexPath.row]
        return cell
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return finalRedditArray.count
        
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        self.selectedRowText = finalRedditArray[indexPath.row]
        performSegueWithIdentifier("showMeBiggerScreen", sender: self)
        viewWillAppear(true)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        var prepareForSegueViewController = segue.destinationViewController as! SecondViewController
        prepareForSegueViewController.textThatShouldDisplay = selectedRowText
        
        
    }


}

