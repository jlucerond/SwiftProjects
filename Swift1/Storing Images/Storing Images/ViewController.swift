//
//  ViewController.swift
//  Storing Images
//
//  Created by Joe Lucero on 2/1/15.
//  Copyright (c) 2015 Joe Lucero. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var imageOnScreen: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
//        let url = NSURL(string: "http://i.kinja-img.com/gawker-media/image/upload/s--5d9jJvYi--/c_fit,fl_progressive,q_80,w_636/dpfowtts23fboplhxy67.jpg")
//        
//        let urlRequest = NSURLRequest(URL: url!)
//        
//        NSURLConnection.sendAsynchronousRequest(urlRequest, queue: NSOperationQueue.mainQueue(), completionHandler: {
//        
//            response, data, error in
//            
//            if error != nil{
//                println("There was an error")
//            }
//            
//            else
//            {
//                let image = UIImage(data: data)
//                //self.imageOnScreen.image = image
//                
                var documentsDirectory: String?
                
                var paths:[AnyObject] = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.UserDomainMask, true)
                
                if paths.count > 0
                {
                    documentsDirectory = paths[0] as? String
                    
                    var savePath = documentsDirectory! + "/pitino.jpg"
                    
//                    NSFileManager.defaultManager().createFileAtPath(savePath, contents: data, attributes: nil)
                    
                    self.imageOnScreen.image = UIImage(named: savePath)
                    
                }
//
//            }
//        })
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

