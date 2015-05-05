//
//  ViewController.swift
//  Downloading Web Content
//
//  Created by Joe Lucero on 4/14/15.
//  Copyright (c) 2015 iOSDevelopr. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //webView in User Interface
    @IBOutlet var webView: UIWebView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Code starts here:

        
        // make a url and a task, which is the place to go and how to go there
        let url = NSURL(string: "http://www.reddit.com")
        let task = NSURLSession.sharedSession().dataTaskWithURL(url!){
            (data, response, error) in
        
            if error == nil {
                
                var urlContent = NSString(data: data, encoding: NSUTF8StringEncoding)
                
                // good if having trouble with slow upload of data. Something about a closure here???
                dispatch_async(dispatch_get_main_queue()){
            
                self.webView.loadHTMLString(urlContent as! String, baseURL: nil)
                    
                }
            }
        
            
            // why doesn't this run when the internet is off???
            else{
                
                let alert = UIAlertView()
                alert.title = "Hey"
                alert.message = "This is  one Alert"
                alert.addButtonWithTitle("Working!!")
                alert.show()
                
            }
            
        }
        
        task.resume()

        
    }


}

