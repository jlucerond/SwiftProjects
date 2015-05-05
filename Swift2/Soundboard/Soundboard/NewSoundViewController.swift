//
//  NewSoundViewController.swift
//  Soundboard
//
//  Created by Joe Lucero on 3/16/15.
//  Copyright (c) 2015 Joe Lucero. All rights reserved.
//

import UIKit
import AVFoundation
import CoreData

class NewSoundViewController : UIViewController {
    //UI properties
    @IBOutlet var soundTextField: UITextField!
    @IBOutlet var recordButton: UIButton!
    
    //variables
    var audioRecorder : AVAudioRecorder
    var audioURL : String
    var previousViewController = SoundListViewController()
    
    //initializing the audioRecorder
    required init(coder aDecoder: NSCoder) {
        var baseString : String = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.UserDomainMask, true)[0] as String
        self.audioURL = NSUUID().UUIDString + ".m4a"
        
        var pathComponents = [baseString, audioURL]
        var audioNSURL = NSURL.fileURLWithPathComponents(pathComponents)!
        
        var session = AVAudioSession.sharedInstance()
        session.setCategory(AVAudioSessionCategoryPlayAndRecord, error: nil)
        
        var recordSettings : [NSObject : AnyObject] = Dictionary()
        recordSettings[AVFormatIDKey] = kAudioFormatMPEG4AAC
        recordSettings[AVSampleRateKey] = 44100.0
        recordSettings[AVNumberOfChannelsKey] = 2
        
        self.audioRecorder = AVAudioRecorder(URL: audioNSURL, settings: recordSettings, error: nil)
        self.audioRecorder.meteringEnabled = true
        self.audioRecorder.prepareToRecord()
        
        // Super init is below
        super.init(coder: aDecoder)
    }

    //functions
    override func viewDidLoad() {
        super.viewDidLoad()
        // Code goes here
        
    }
    
    //IB functions
    @IBAction func cancelButtonPushed(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    @IBAction func saveButtonPushed(sender: AnyObject) {
        // Introduce context (coredata)
        var context = (UIApplication.sharedApplication().delegate as AppDelegate).managedObjectContext!

        
        // Create a Sound Object
        var sound = NSEntityDescription.insertNewObjectForEntityForName("Sound", inManagedObjectContext: context) as Sound
        sound.name = soundTextField.text
        sound.url = audioURL
        
        // Save Sound to Core Data
        context.save(nil)

        
        // Dismiss View Controller
        dismissViewControllerAnimated(true, completion: nil)
        
    }
    @IBAction func recordButtonPushed(sender: AnyObject) {
        
        if self.audioRecorder.recording {
            self.audioRecorder.stop()
            self.recordButton.setTitle("RECORD", forState: UIControlState.Normal)
            println("recording has stopped")
            
        }
        
        else {
            var session = AVAudioSession.sharedInstance()
            session.setActive(true, error: nil)
            self.audioRecorder.record()
            self.recordButton.setTitle("STOP RECORDING", forState: UIControlState.Normal)
            println("recording is started")
        }

    }
    
    
}

