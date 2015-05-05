//
//  ViewController.swift
//  Stopwatch
//
//  Created by Joe Lucero on 1/8/15.
//  Copyright (c) 2015 Joe Lucero. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var numberOfSecondsElapsed: UILabel!
    var x = 0.0
    var timer = NSTimer()
    
    @IBAction func startButtonPushed(sender: UIButton)
    {
        timer = NSTimer.scheduledTimerWithTimeInterval(0.1, target: self, selector: Selector("timerResult"), userInfo: nil, repeats: true)
    }
    
    @IBAction func stopButtonPushed(sender: UIButton)
    {
        timer.invalidate()
    }
    
    @IBAction func resetButtonPushed(sender: UIButton)
    {
        timer.invalidate()
        x = 0
        numberOfSecondsElapsed.text = "0"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func timerResult ()
    {
        x = x + 0.1;
        println(x)
        numberOfSecondsElapsed.text = "\(x)"
    }


}

