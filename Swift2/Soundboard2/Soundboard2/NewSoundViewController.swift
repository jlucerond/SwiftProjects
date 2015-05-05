//
//  NewSoundViewController.swift
//  Soundboard2
//
//  Created by Joe Lucero on 3/22/15.
//  Copyright (c) 2015 Joe Lucero. All rights reserved.
//

import UIKit
import AVFoundation
import CoreData

class NewSoundViewController: UIViewController {
    //Interface Builder variables
    @IBOutlet var recordButtonLabel: UIButton!
    @IBOutlet var userTextField: UITextField!
    @IBOutlet var soundButtonImage: UIImageView!
    
    //JL Variables
    var recordingState = 0
    var previousViewController = SoundListViewController()
    var joesAudioRecorder : AVAudioRecorder
    var audioURL : String
    
    //Required Initializer (because we don't set joesAudioRecorder as equal to anything above
    required init(coder aDecoder: NSCoder) {
        var baseString : String = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.UserDomainMask, true)[0] as String
        audioURL = NSUUID().UUIDString + ".m4a"
        var pathComponents = [baseString, audioURL]
        var audioNSURL = NSURL.fileURLWithPathComponents(pathComponents)!
        
        var session = AVAudioSession.sharedInstance()
        session.setCategory(AVAudioSessionCategoryPlayAndRecord, error: nil)
        
        var recordSettings : [NSObject : AnyObject] = Dictionary()
        recordSettings[AVFormatIDKey] = kAudioFormatMPEG4AAC
        recordSettings[AVSampleRateKey] = 44100.0
        recordSettings[AVNumberOfChannelsKey] = 2
        
        self.joesAudioRecorder = AVAudioRecorder(URL: audioNSURL, settings: recordSettings, error: nil)
        self.joesAudioRecorder.meteringEnabled = true
        self.joesAudioRecorder.prepareToRecord()
        
        //super init is below
        super.init(coder: aDecoder)
    }


    override func viewDidLoad() {
        super.viewDidLoad()
        recordingState = 0

        // Do any additional setup after loading the view.
        
    }

    @IBAction func recordButtonPushed(sender: AnyObject) {
        
            if recordingState%2 == 0{
                joesAudioRecorder.record()
                recordButtonLabel.setTitle("STOP RECORDING", forState: UIControlState.Normal)
                soundButtonImage.hidden = true
                recordingState++
            }
            else{
                joesAudioRecorder.stop()
                recordButtonLabel.setTitle("Redo", forState: UIControlState.Normal)
                soundButtonImage.hidden = false
                recordingState++
            }
    }
    
    @IBAction func saveButtonPushed(sender: AnyObject) {
        // create context to give a space in coreData to save an object
        var context = (UIApplication.sharedApplication().delegate as AppDelegate).managedObjectContext!

        // create a new sound object
        var newSoundObject = NSEntityDescription.insertNewObjectForEntityForName("Sound", inManagedObjectContext: context) as Sound
        newSoundObject.name = userTextField.text
        newSoundObject.url = audioURL

        //append our new sound and then save
        previousViewController.listOfSounds.append(newSoundObject)
        context.save(nil)
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func cancelButtonPushed(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    

}
