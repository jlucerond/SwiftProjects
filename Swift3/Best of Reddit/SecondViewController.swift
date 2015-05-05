//
//  SecondViewController.swift
//  Best of Reddit
//
//  Created by Joe Lucero on 4/15/15.
//  Copyright (c) 2015 iOSDevelopr. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet var oneAndOnlyLabelHere: UILabel!
    var textThatShouldDisplay = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.oneAndOnlyLabelHere.text = textThatShouldDisplay
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
