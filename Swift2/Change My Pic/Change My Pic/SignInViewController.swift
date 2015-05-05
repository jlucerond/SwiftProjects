//
//  SignInViewController.swift
//  Change My Pic
//
//  Created by Joe Lucero on 3/27/15.
//  Copyright (c) 2015 Joe Lucero. All rights reserved.
//

import UIKit
import Accounts
import Social

class SignInViewController: UIViewController {
    
    var twitterAccount : ACAccount? = nil

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func signInWithTwitter(sender: AnyObject) {
        let account = ACAccountStore()
        
        let accountType = account.accountTypeWithAccountTypeIdentifier(ACAccountTypeIdentifierTwitter)
        
        account.requestAccessToAccountsWithType(accountType, options: nil) { (granted: Bool, error: NSError!) -> Void in
            
            if granted{
                let allAccounts = account.accountsWithAccountType(accountType)
                if allAccounts.count > 0 {
                    let twitterAccount = allAccounts.last as ACAccount
                    self.twitterAccount = twitterAccount
                    
                    let requestAPI = NSURL(string: "https://api.twitter.com/1.1/account/verify_credentials.json")
                    let userRequest = SLRequest(forServiceType: SLServiceTypeTwitter, requestMethod: SLRequestMethod.GET, URL: requestAPI, parameters: nil)
                    
                    userRequest.account = twitterAccount
                    userRequest.performRequestWithHandler({ (response:NSData!, urlResponse:NSHTTPURLResponse!, error:NSError!) -> Void in
                        
                        var error = NSErrorPointer()
                        
                        let responseDictionary = NSJSONSerialization.JSONObjectWithData(response, options: NSJSONReadingOptions.MutableLeaves, error: error) as [String:AnyObject]
                        
                        var imageURL = responseDictionary["profile_image_url_https"] as String
                        
                        imageURL = imageURL.stringByReplacingOccurrencesOfString("_normal", withString: "", options: NSStringCompareOptions.LiteralSearch, range: nil)
                        
                        var imageRequest = NSURLRequest(URL: NSURL(string: imageURL)!)
                        
                        NSURLConnection.sendAsynchronousRequest(imageRequest, queue: NSOperationQueue.mainQueue(), completionHandler: { (imageResponse : NSURLResponse!, imageData:NSData!, imageError:NSError!) -> Void in
                            var image = UIImage(data: imageData)
                            self.performSegueWithIdentifier("signInToTextSegue", sender: image)
                        })
                        
                    })
                }
            }
            
            else{
                println("access denied")
            }
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let addTextViewController = segue.destinationViewController as AddTextViewController
        addTextViewController.profileImage = (sender as UIImage)
        addTextViewController.twitterAccount = self.twitterAccount
    }

}
