//
//  Sound.swift
//  Soundboard2
//
//  Created by Joe Lucero on 3/22/15.
//  Copyright (c) 2015 Joe Lucero. All rights reserved.
//

import Foundation
import CoreData

class Sound: NSManagedObject {

    @NSManaged var name: String
    @NSManaged var url: String

}
