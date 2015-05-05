//
//  SoundListViewController.swift
//  Soundboard2
//
//  Created by Joe Lucero on 3/21/15.
//  Copyright (c) 2015 Joe Lucero. All rights reserved.
//

import UIKit
import AVFoundation
import CoreData

class SoundListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    //Interface Builder variables
    @IBOutlet var theTableInThisViewController: UITableView!
    
    //My Variables
    var joesAudioPlayer = AVAudioPlayer()
    var listOfSounds : [Sound] = []
    var randomBSvariable = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        theTableInThisViewController.dataSource = self
        theTableInThisViewController.delegate = self
        
        var context = (UIApplication.sharedApplication().delegate as AppDelegate).managedObjectContext!
        var request = NSFetchRequest(entityName: "Sound")
        listOfSounds = context.executeFetchRequest(request, error: nil)! as [Sound]
        
//          //here's core-data making test sounds stuff
//        var soundPath = NSBundle.mainBundle().pathForResource("FinalCountdown", ofType: "mp3")
//        var soundURL = NSURL.fileURLWithPath(soundPath!)
//        var sound1 = NSEntityDescription.insertNewObjectForEntityForName("Sound", inManagedObjectContext: context) as Sound
//        sound1.name = "Still Trying"
//        sound1.url = soundURL!.absoluteString!
//        
//        context.save(nil)
//        

        
        
        //THIS IS CODE FOR NON-CORE DATA STUFF
//        var sound1 = JLSound()
//        sound1.name = "The Final Countdown"
//        var soundPath = NSBundle.mainBundle().pathForResource("FinalCountdown", ofType: "mp3")
//        sound1.URL = NSURL.fileURLWithPath(soundPath!)!
//        listOfSounds.append(sound1)
//
//        var sound2 = JLSound()
//        sound2.name = "Second Countdown"
//        sound2.URL = NSURL.fileURLWithPath(soundPath!)!
//        listOfSounds.append(sound2)
        
    }
    
    override func viewDidAppear(animated: Bool) {
                var context = (UIApplication.sharedApplication().delegate as AppDelegate).managedObjectContext!
        
//                var soundPath = NSBundle.mainBundle().pathForResource("FinalCountdown", ofType: "mp3")
//                var soundURL = NSURL.fileURLWithPath(soundPath!)
//                var sound1 = NSEntityDescription.insertNewObjectForEntityForName("Sound", inManagedObjectContext: context) as Sound
//                sound1.name = "Still Trying"
//                sound1.url = soundURL!.absoluteString!
//        
//                context.save(nil)
        
                var request = NSFetchRequest(entityName: "Sound")
                listOfSounds = context.executeFetchRequest(request, error: nil)! as [Sound]
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listOfSounds.count
        
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var theCellThatIJustMade = UITableViewCell()
        theCellThatIJustMade.textLabel?.text = listOfSounds[indexPath.row].name
        return theCellThatIJustMade
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        var theSoundThatNeedsToPlayRightNow = listOfSounds[indexPath.row]
        
        var baseString : String = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.UserDomainMask, true)[0] as String
        var pathComponents = [baseString, theSoundThatNeedsToPlayRightNow.url]
        var audioNSURL = NSURL.fileURLWithPathComponents(pathComponents)!

        
        //this is the stuff I don't understand
        //watch the core data part 2 video here
        
//        var baseString : String = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.UserDomainMask, true)[0] as String
//        var pathComponents = [baseString, theSoundThatNeedsToPlayRightNow.url]
//        var audioNSURL = NSURL.fileURLWithPathComponents(pathComponents)!
        
        joesAudioPlayer = AVAudioPlayer(contentsOfURL: audioNSURL, error: nil)
        joesAudioPlayer.play()
        
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        var nextSoundViewController = segue.destinationViewController as NewSoundViewController
        nextSoundViewController.previousViewController = self
    }

}

