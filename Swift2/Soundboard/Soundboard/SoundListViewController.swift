//
//  SoundListViewController.swift
//  Soundboard
//
//  Created by Joe Lucero on 3/15/15.
//  Copyright (c) 2015 Joe Lucero. All rights reserved.
//

import UIKit
import AVFoundation
import CoreData

class SoundListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    //properties
    @IBOutlet var tableView: UITableView!
    var audioPlayer = AVAudioPlayer()
    var sounds : [Sound] = []

    //functions
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.tableView.dataSource = self
        self.tableView.delegate = self
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        // start
        var context = (UIApplication.sharedApplication().delegate as AppDelegate).managedObjectContext!
        var request = NSFetchRequest (entityName: "Sound")
        self.sounds = context.executeFetchRequest(request, error: nil)! as [Sound]

    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sounds.count
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = UITableViewCell()
        var sound = sounds[indexPath.row]
        cell.textLabel?.text = sound.name
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        var sound = sounds[indexPath.row]

        var baseString : String = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.UserDomainMask, true)[0] as String
        var pathComponents = [baseString, sound.url]
        var audioNSURL = NSURL.fileURLWithPathComponents(pathComponents)!
        
        audioPlayer = AVAudioPlayer(contentsOfURL: audioNSURL, error: nil)
        audioPlayer.play()
        
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        var nextViewController = segue.destinationViewController as NewSoundViewController
        nextViewController.previousViewController = self
    }
    
    
}

