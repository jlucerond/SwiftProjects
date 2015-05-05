//
//  ViewController.swift
//  Shake and Swipe
//
//  Created by Joe Lucero on 1/26/15.
//  Copyright (c) 2015 Joe Lucero. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var player:AVAudioPlayer = AVAudioPlayer()

    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
//        var swipeRight = UISwipeGestureRecognizer(target: self, action: "swiped:")
//        swipeRight.direction = UISwipeGestureRecognizerDirection.Right
//        self.view.addGestureRecognizer(swipeRight)
//        
//        var swipeLeft = UISwipeGestureRecognizer(target: self, action: "swiped:")
//        swipeLeft.direction = UISwipeGestureRecognizerDirection.Left
//        self.view.addGestureRecognizer(swipeLeft)
        
        var fileLocation = NSString(string: NSBundle.mainBundle().pathForResource("sounds/blop", ofType: "mp3")!)
        
        var error:NSError? = nil
        
        player = AVAudioPlayer(contentsOfURL: NSURL(string: fileLocation), error: &error)
        
        player.play()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func motionEnded(motion: UIEventSubtype, withEvent event: UIEvent) {
        println("shake")
    }
    
    func swiped (gesture: UIGestureRecognizer) {
        
        if let swipeGesture = gesture as? UISwipeGestureRecognizer
        {
            switch swipeGesture.direction
            {
            case UISwipeGestureRecognizerDirection.Right:
                println("User swiped right")
                
            case UISwipeGestureRecognizerDirection.Left:
                println("User swiped left")
                
            default: break
            }
        }
        
        
    }


}

