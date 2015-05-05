//
//  DetailViewController.swift
//  DefinEmoji
//
//  Created by Joe Lucero on 3/20/15.
//  Copyright (c) 2015 Joe Lucero. All rights reserved.
//

import UIKit

class DetailViewController : UIViewController{
    @IBOutlet var detailEmojiPicture: UILabel!
    @IBOutlet var detailEmojiDefinition: UILabel!
    
    var emojiThatNeedsToTransfer = ""
    var emojiDefinitionThatNeedsToTransfer = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //get ready
        
        detailEmojiPicture?.text = emojiThatNeedsToTransfer
        detailEmojiDefinition?.text = emojiDefinitionThatNeedsToTransfer
        
    }
    
    
}
