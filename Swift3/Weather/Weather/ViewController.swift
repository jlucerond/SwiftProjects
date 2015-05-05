//
//  ViewController.swift
//  Weather
//
//  Created by Joe Lucero on 4/14/15.
//  Copyright (c) 2015 iOSDevelopr. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    //outlets & variables
    @IBOutlet var textField: UITextField!
    @IBOutlet var weatherLabel: UILabel!
    var theWeather = ""
    var urlError = false
    
    
    
    //functions
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.textField.delegate = self
        

    }
    @IBAction func checkButtonPressed(sender: AnyObject) {
        
        
        if textField.hasText() {
        
            var url = NSURL(string: "http://www.weather-forecast.com/locations/" + textField.text.stringByReplacingOccurrencesOfString(" ", withString: "-") + "/forecasts/latest")
        
            if url != nil {
            let task = NSURLSession.sharedSession().dataTaskWithURL(url!, completionHandler: { (data, response, error) -> Void in
                
                self.urlError = false
                
                if error == nil {
                    var urlContent = NSString(data: data, encoding: NSUTF8StringEncoding) as NSString!
                    
                    var urlContentArray = urlContent.componentsSeparatedByString("<span class=\"phrase\">")
                    
                    if urlContentArray.count > 1 {
                        
                        var weatherArray = urlContentArray[1].componentsSeparatedByString("</span>")
                        var weather : String = weatherArray[0] as! String
                        weather = weather.stringByReplacingOccurrencesOfString("&deg;", withString: "°")
                        self.theWeather = weather as String
                    }
                        
                    else{
                        self.urlError = true
                    }
                    
                }
                    
                else {
                    self.urlError = true
                }
                
                dispatch_async(dispatch_get_main_queue()){
                    
                    if self.urlError == true {
                        self.showError()
                    }
                        
                    else
                    {
                        self.weatherLabel.text = self.theWeather
                    }
                }
                
            })
            
            task.resume()
            
        }
            
            else {
            showError()
        }
        }
        else{
            showError()
        }
        self.textField.resignFirstResponder()
        textField.text = ""

    }
    func showError(){
        weatherLabel.text = "did not find a city with that name"
    }
    
    func textFieldShouldReturn(textField : UITextField) -> Bool {
        checkButtonPressed(self)
        return true
    }

}

