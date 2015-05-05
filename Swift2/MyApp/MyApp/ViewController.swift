//
//  ViewController.swift
//  MyApp
//
//  Created by Joe Lucero on 3/12/15.
//  Copyright (c) 2015 Joe Lucero. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func buttonTapped(sender: AnyObject) {
        
        self.view.backgroundColor = UIColor.redColor()
        
    }

}

