//
//  ViewController.swift
//  Images
//
//  Created by Joe Lucero on 1/14/15.
//  Copyright (c) 2015 Joe Lucero. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var billSimmons: UIImageView!
    var currentFrame = 1
    var timer = NSTimer()
    var x = 0
    let frame1 = UIImage(named: "bill1.png")
    let frame2 = UIImage(named: "bill2.png")
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        timer = NSTimer.scheduledTimerWithTimeInterval(0.3, target: self, selector: Selector("timerResult"), userInfo: nil, repeats: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

//    @IBAction func nextFrame(sender: AnyObject)
//    {
//
////        
////
////        
////        if  currentFrame == 1
////        {
////            currentFrame = 2
////            billSimmons.image = frame2
////        }
////        else
////        {
////            currentFrame = 1
////            billSimmons.image = frame1
////        }
//
//    }
    
    
    func timerResult ()
    {
        x = x + 1;
        println(x)
        if x % 2 == 0
        {
            billSimmons.image = frame2
        }
        else
        {
            billSimmons.image = frame1
        }
    }
    
    override func viewDidLayoutSubviews() {
        
        billSimmons.frame = CGRectMake(20, 100, 0, 0)
        
        //billSimmons.center = CGPointMake(billSimmons.center.x - 400, billSimmons.center.y)
        
    }
    
    override func viewDidAppear(animated: Bool) {
        
        UIView.animateWithDuration(6, animations: {self.billSimmons.frame = CGRectMake(20, 100, 300, 150)})
        
        
    }

}

