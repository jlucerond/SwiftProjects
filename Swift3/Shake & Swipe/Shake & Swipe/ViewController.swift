//
//  ViewController.swift
//  Shake & Swipe
//
//  Created by Joe Lucero on 4/18/15.
//  Copyright (c) 2015 iOSDevelopr. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        var swipeRight = UISwipeGestureRecognizer(target: self, action: "swiped:")
        swipeRight.direction = UISwipeGestureRecognizerDirection.Right
        self.view.addGestureRecognizer(swipeRight)
        
        var swipeUp = UISwipeGestureRecognizer(target: self, action: "swiped:")
        swipeUp.direction = UISwipeGestureRecognizerDirection.Up
        self.view.addGestureRecognizer(swipeUp)
        
        var swipeLeft = UISwipeGestureRecognizer(target: self, action: "swiped:")
        swipeLeft.direction = UISwipeGestureRecognizerDirection.Left
        self.view.addGestureRecognizer(swipeLeft)
        
        var swipeDown = UISwipeGestureRecognizer(target: self, action: "swiped:")
        swipeDown.direction = UISwipeGestureRecognizerDirection.Down
        self.view.addGestureRecognizer(swipeDown)
        
        //no idea what this is
        var allZeros = UISwipeGestureRecognizer(target: self, action: "swiped:")
        allZeros.direction = UISwipeGestureRecognizerDirection.allZeros
        self.view.addGestureRecognizer(allZeros)
    }
    
    func swiped(gesture: UIGestureRecognizer){
        
        if let swipeGesture = gesture as? UISwipeGestureRecognizer {
            
            switch swipeGesture.direction {
                case UISwipeGestureRecognizerDirection.Right : println("right swiped")
                case UISwipeGestureRecognizerDirection.Left : println("left swipe dat")
                case UISwipeGestureRecognizerDirection.Up : println("up")
                case UISwipeGestureRecognizerDirection.allZeros : println("???????")
                case UISwipeGestureRecognizerDirection.Down : println("get down")
                default: break
            }
            
        }
    }
    
    override func motionEnded(motion: UIEventSubtype, withEvent event: UIEvent) {
        println("user shook")
    }


}

