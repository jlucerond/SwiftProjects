//
//  ViewController.swift
//  What's the Weather
//
//  Created by Joe Lucero on 1/13/15.
//  Copyright (c) 2015 Joe Lucero. All rights reserved.
//

import UIKit
import Foundation

class ViewController: UIViewController {
    @IBOutlet var cityName: UITextField!
    @IBOutlet var weatherMessage: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func weatherButtonPushed(sender: AnyObject)
    {
        var urlString = "http://www.weather-forecast.com/locations/" + cityName.text.stringByReplacingOccurrencesOfString(" ", withString: "") + "/forecasts/latest"
        
        var url = NSURL(string: urlString)
        
        let task = NSURLSession.sharedSession().dataTaskWithURL(url!)
        {(data, response, error) in
            
            var urlContent = NSString(data: data, encoding: NSUTF8StringEncoding)
            
            let tempurlContent: String = urlContent as String
            
            if (tempurlContent._bridgeToObjectiveC().containsString("<span class=\"read-more-content\"> <span class=\"phrase\">"))
            {
            
                var contentArray = urlContent!.componentsSeparatedByString("<span class=\"read-more-content\"> <span class=\"phrase\">")
                var newContentArray = contentArray[1].componentsSeparatedByString("</span>")
            
                println(newContentArray[0])
            
                dispatch_async(dispatch_get_main_queue())
                {
                    self.weatherMessage.text = self.cleanWeatherString(newContentArray[0] as String)}
                }
            
            else
            {
                
                dispatch_async(dispatch_get_main_queue())
                    {
                        self.weatherMessage.text = "Could not find that city - please try again"}
            
            }
            
            
            
        }
        
                task.resume()
        

    }
    
    func cleanWeatherString(string: String) -> NSString
    {
        return string.stringByReplacingOccurrencesOfString("&deg;", withString: "°", options: nil, range: nil)
    }

}

