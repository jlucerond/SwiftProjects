//
//  ViewController.swift
//  Webview Demo
//
//  Created by Joe Lucero on 2/3/15.
//  Copyright (c) 2015 Joe Lucero. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var webview: UIWebView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
//   TO LOAD INFORMATION FROM WEB:
//        var url = NSURL(string: "http://www.google.com")
//
//        var request = NSURLRequest(URL:url!)
//        
//        webview.loadRequest(request)
        
//   TO LOAD INFORMATION FROM HTML:
        var html = "<html><head></head><body><h1>Hello World!</h1></body></html>"
        
        webview.loadHTMLString(html, baseURL: nil)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

