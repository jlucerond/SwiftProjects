//
//  ViewController.swift
//  Core Data Demo
//
//  Created by Joe Lucero on 1/28/15.
//  Copyright (c) 2015 Joe Lucero. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        var appDel:AppDelegate = UIApplication.sharedApplication().delegate as AppDelegate
        
        var context:NSManagedObjectContext = appDel.managedObjectContext!
        
//        var newUser = NSEntityDescription.insertNewObjectForEntityForName("Users", inManagedObjectContext: context) as NSManagedObject
//        
//        newUser.setValue("Stevie", forKey: "username")
//        newUser.setValue("kennypowers", forKey: "password")
//        
//        context.save(nil)

        var request = NSFetchRequest(entityName: "Users")
        request.returnsObjectsAsFaults = false
        request.predicate = NSPredicate(format: "username = %@", "Kevin")
        
        var results = context.executeFetchRequest(request, error: nil)
        
        if results?.count > 0
        {
            
            for result: AnyObject in results!
            {
                
                if var user = result.valueForKey("username") as? String
                {
                    if user == "Kevin"
                    {
                        result.setValue("newpassword", forKey: "password")
                    }
                }
            }
            context.save(nil)
            
        }
        else
        {
            println("No results")
        }
        
        println(results)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

