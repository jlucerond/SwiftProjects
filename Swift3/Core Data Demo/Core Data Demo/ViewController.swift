//
//  ViewController.swift
//  Core Data Demo
//
//  Created by Joe Lucero on 4/18/15.
//  Copyright (c) 2015 iOSDevelopr. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        var appDel : AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        var context : NSManagedObjectContext = appDel.managedObjectContext!
        var newUser = NSEntityDescription.insertNewObjectForEntityForName("Users", inManagedObjectContext: context) as! NSManagedObject
        
//        newUser.setValue("John", forKey: "userName")
//        newUser.setValue("hisPW", forKey: "password")
//        
//        context.save(nil)
        
        var request = NSFetchRequest(entityName: "Users")
        request.returnsObjectsAsFaults = false
        
        var results = context.executeFetchRequest(request, error: nil)
        
        for result: AnyObject in results! {
            println(result.password)
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

