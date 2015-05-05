//
//  ViewController.swift
//  music
//
//  Created by Joe Lucero on 1/22/15.
//  Copyright (c) 2015 Joe Lucero. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    @IBOutlet var volumeSlider: UISlider!
    
    var player:AVAudioPlayer = AVAudioPlayer()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        var fileLocation = NSString(string:NSBundle.mainBundle().pathForResource("Yes", ofType: "mp3")!)
        
        var error: NSError? = nil
        
        player = AVAudioPlayer(contentsOfURL: NSURL(string: fileLocation), error: &error)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func playButtonPressed(sender: AnyObject)
    {
        player.play()
    }
    @IBAction func pauseButtonPressed(sender: AnyObject)
    {
        player.pause()
    }
    @IBAction func stopButtonPressed(sender: AnyObject)
    {
        player.stop()
        player.currentTime = 0
    }
    @IBAction func changeVolume(sender: AnyObject)
    {
        player.volume = volumeSlider.value
    }
    
    
}

