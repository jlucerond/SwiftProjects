//
//  ViewController.swift
//  Animations
//
//  Created by Joe Lucero on 4/15/15.
//  Copyright (c) 2015 iOSDevelopr. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var billPic: UIImageView!
    var myNum = 1
    var timer = NSTimer()
    var isTimerGoing = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        timer = NSTimer.scheduledTimerWithTimeInterval(0.1, target: self, selector: Selector("timerRunning"), userInfo: nil, repeats: true)
    }

    @IBAction func buttonHit(sender: AnyObject) {
        
        if isTimerGoing{
            isTimerGoing = false
            timer.invalidate()

        }
        
        else{
            isTimerGoing = true
            timer = NSTimer.scheduledTimerWithTimeInterval(0.1, target: self, selector: Selector("timerRunning"), userInfo: nil, repeats: true)
            }
        }
    
    
    func timerRunning(){
        if myNum == 1 {
            billPic.image = UIImage(named: "bill2.png")
            myNum = 2
        }
        else {
            billPic.image = UIImage(named: "bill1.png")
            myNum = 1
        }
    }
    
    
    // use the combination of viewdidlayoutsubviews and viewdidappear to say where things should start and where they should end up
//    override func viewDidLayoutSubviews() {
//        // runs before the View Controller is displayed
//        
//        billPic.center = CGPointMake(billPic.center.x-500, billPic.center.y)
//    }
//    
//    override func viewDidAppear(animated: Bool) {
//        // runs right when the View Controller appears on screen
//        
//        UIView.animateWithDuration(5, animations: { () -> Void in
//            self.billPic.center = CGPointMake(self.billPic.center.x+500, self.billPic.center.y)
//        })
//    }
    
    // use the same combination as above to start things as hidden and then make them un-hidden. could probably do the hidden part in the main.storyboard portion
//    override func viewDidLayoutSubviews() {
//        billPic.alpha = 0
//    }
//    
//    override func viewDidAppear(animated: Bool) {
//        UIView.animateWithDuration(3, animations: { () -> Void in
//            self.billPic.alpha = 1
//        })
//    }
//
//
    
    override func viewDidLayoutSubviews() {
        billPic.frame = CGRectMake(20, 220, 0, 0)
        viewDidAppear(false)
    }
    
    override func viewDidAppear(animated: Bool) {
        UIView.animateWithDuration(5, animations: { () -> Void in
            self.billPic.frame = CGRectMake(20, 20, 320, 180)
        })
    }



}

