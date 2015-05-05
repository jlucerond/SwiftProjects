//
//  CreateNewPatternViewController.swift
//  Patterns
//
//  Created by Joe Lucero on 3/19/15.
//  Copyright (c) 2015 Joe Lucero. All rights reserved.
//

import UIKit
import CoreData

class CreateNewPatternViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    @IBOutlet var nameForPattern: UITextField!
    @IBOutlet var frontImageView: UIImageView!
    @IBOutlet var backImageView: UIImageView!
    @IBOutlet var frontCameraUsageLabel: UILabel!
    @IBOutlet var backCameraUsageLabel: UILabel!
    var frontPicture = true
    
    
    
    //functions start here
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        var frontTapRecognizer = UITapGestureRecognizer(target: self, action: "frontTapped")
        self.frontImageView.addGestureRecognizer(frontTapRecognizer)
        
        var backTapRecognizer = UITapGestureRecognizer(target: self, action: "backTapped")
        self.backImageView.addGestureRecognizer(backTapRecognizer)
    }
    
    
    func frontTapped(){
        frontCameraUsageLabel.hidden = true
        frontPicture = true
        launchCamera()
    }
    func backTapped(){
        backCameraUsageLabel.hidden = true
        frontPicture = false
        launchCamera()
    }

    @IBAction func cancelButtonTapped(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    @IBAction func saveButtonTapped(sender: AnyObject) {
        var context = (UIApplication.sharedApplication().delegate as AppDelegate).managedObjectContext!
        var pattern = NSEntityDescription.insertNewObjectForEntityForName("Pattern", inManagedObjectContext: context) as Pattern
        
        pattern.name = nameForPattern.text
        pattern.frontImage = UIImageJPEGRepresentation(frontImageView.image?, 1)
        pattern.backImage = UIImageJPEGRepresentation(backImageView.image?, 1)
            
        context.save(nil)
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    func launchCamera(){
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.Camera)
        {
            println("you can take a picture")
            var cameraViewController = UIImagePickerController()
            cameraViewController.sourceType = UIImagePickerControllerSourceType.Camera
            cameraViewController.delegate = self
            self.presentViewController(cameraViewController, animated: true, completion: nil)
        }
        else
        {
            println("sorry, no camera is available")
        }
    }
    
    // this only works with a camera
    // un-comment this after you get a Developer's Account
    /*
    
    func imagePickerController(picker: UIImagePickerController!, didFinishPickingImage image: UIImage!, editingInfo: [NSObject : AnyObject]!) {
        if frontPicture{
            frontImageView.image = image

        }
        
        else{
            backImageView.image = image
        }
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    */
    
}
