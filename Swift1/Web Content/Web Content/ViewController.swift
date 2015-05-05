//
//  ViewController.swift
//  Web Content
//
//  Created by Joe Lucero on 1/13/15.
//  Copyright (c) 2015 Joe Lucero. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        var url = NSURL(string: "http://www.stackoverflow.com")
        
        let task = NSURLSession.sharedSession().dataTaskWithURL(url!)
        {
                (data, response, error) in
            
            println ( NSString (data: data, encoding:NSUTF8StringEncoding))
        }
        
        task.resume()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

