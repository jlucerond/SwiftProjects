//
//  Pattern.swift
//  Patterns
//
//  Created by Joe Lucero on 3/18/15.
//  Copyright (c) 2015 Joe Lucero. All rights reserved.
//

import Foundation
import CoreData

class Pattern: NSManagedObject {

    @NSManaged var name: String
    @NSManaged var frontImage: NSData
    @NSManaged var backImage: NSData

}
