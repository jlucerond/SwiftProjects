//
//  AddTextViewController.swift
//  Change My Pic
//
//  Created by Joe Lucero on 3/31/15.
//  Copyright (c) 2015 Joe Lucero. All rights reserved.
//

import UIKit
import Accounts

class AddTextViewController: UIViewController {

    @IBOutlet var textField: UITextField!
    var profileImage : UIImage? = nil
    var twitterAccount : ACAccount? = nil

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let nextViewController = segue.destinationViewController as PublishPicViewController
        nextViewController.profileImage = profileImage
        nextViewController.imageText = textField.text
        nextViewController.twitterAccount = self.twitterAccount
    }



}
