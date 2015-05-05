//
//  PublishPicViewController.swift
//  Change My Pic
//
//  Created by Joe Lucero on 4/1/15.
//  Copyright (c) 2015 Joe Lucero. All rights reserved.
//

import UIKit
import Social
import Accounts

class PublishPicViewController: UIViewController {
    
    var profileImage : UIImage? = nil
    var imageText = ""
    var twitterAccount : ACAccount? = nil

    
    
    @IBOutlet var profilePictureImageView: UIImageView!
    @IBOutlet var profilePictureTextLabel: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // I hate this guy
        
        self.profilePictureImageView.image = editPic(imageText, image: profileImage!)
        
    }
    
    func editPic(text: String, image : UIImage) -> UIImage {
        
        UIGraphicsBeginImageContext(image.size)
        image.drawInRect(CGRectMake(0, 0, image.size.width, image.size.height))
        
        UIColor(white: 0, alpha: 0.2).set()
        CGContextFillRect(UIGraphicsGetCurrentContext(), CGRectMake(0, image.size.height - (image.size.height*0.2), image.size.width, (image.size.height*0.2)))
        
        var rect = CGRectMake(0, image.size.height - (image.size.height*0.2), image.size.width, (image.size.height*0.2))
        let newText : NSString = text
        var style = NSMutableParagraphStyle.defaultParagraphStyle().mutableCopy() as NSMutableParagraphStyle
        style.alignment = NSTextAlignment.Center
        var attrs = [NSFontAttributeName : UIFont.systemFontOfSize(image.size.height*0.2), NSForegroundColorAttributeName : UIColor.whiteColor(), NSParagraphStyleAttributeName : style]
        newText.drawInRect(CGRectIntegral(rect), withAttributes: attrs)
        
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return newImage
    }

    
    @IBAction func updatePictureButtonPushed(sender: AnyObject) {
        let requestAPI = NSURL(string: "https://api.twitter.com/1.1/account/update_profile_image.json")
        let picData = UIImagePNGRepresentation(self.profilePictureImageView.image)
        let base64Image = picData.base64EncodedStringWithOptions(NSDataBase64EncodingOptions.Encoding64CharacterLineLength)
        
        let userRequest = SLRequest(forServiceType: SLServiceTypeTwitter, requestMethod: SLRequestMethod.POST, URL: requestAPI, parameters: nil)
        
        userRequest.account = self.twitterAccount
        
        userRequest.performRequestWithHandler({ (response:NSData!, urlResponse:NSHTTPURLResponse!, error:NSError!) -> Void in
            
            var error = NSErrorPointer()
            
            let responseDictionary = NSJSONSerialization.JSONObjectWithData(response, options: NSJSONReadingOptions.MutableLeaves, error: error) as [String:AnyObject]
            
            if urlResponse.statusCode == 200
            {
                //worked
                var alertController = UIAlertController(title: "Pic Updated!", message: "Everything worked", preferredStyle: UIAlertControllerStyle.Alert)
                var alertAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil)
                alertController.addAction(alertAction)
                self.presentViewController(alertController, animated: true, completion: nil)
            }
            
            else
            {
                //didn't work
                var alertController = UIAlertController(title: "Uh oh!", message: "Unable to Update Your Pic", preferredStyle: UIAlertControllerStyle.Alert)
                var alertAction = UIAlertAction(title: "Sorry", style: UIAlertActionStyle.Default, handler: nil)
                alertController.addAction(alertAction)
                self.presentViewController(alertController, animated: true, completion: nil)
            }
            
        
        })
            
    }


}
