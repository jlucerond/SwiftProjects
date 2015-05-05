//
//  ViewController.swift
//  Stopwatch
//
//  Created by Joe Lucero on 4/10/15.
//  Copyright (c) 2015 Joe Lucero. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //things
    @IBOutlet var timerLabel: UILabel!
    var timer = NSTimer()
    var count = 0.0
    var hasBeenTurnedOn = false
    
    //xcode actions
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //our actions
    @IBAction func playButton(sender: AnyObject) {
        if hasBeenTurnedOn{
            //do nothing
        }
        
        else{
            timer = NSTimer.scheduledTimerWithTimeInterval(0.1, target: self, selector: Selector("goGoGo"), userInfo: nil, repeats: true)
            hasBeenTurnedOn = true
        }
    }
    
    @IBAction func pauseButton(sender: AnyObject) {
        timer.invalidate()
        hasBeenTurnedOn = false
    }

    @IBAction func resetButton(sender: AnyObject) {
        count = 0
        timerLabel.text = "0.0"
    }
    
    func goGoGo(){
        
        count = count + 0.1
        
        // taken from stack overflow; multiplies count by 100, gets the integer value, then divides by 100
        let numberOfPlaces = 2.0
        let multiplier = pow(10.0, numberOfPlaces)
        let rounded = round(count * multiplier) / multiplier
        println(rounded)
        
        timerLabel.text = "\(rounded)"
        
    }
    
}

