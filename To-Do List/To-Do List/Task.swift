//
//  Task.swift
//  To-Do List
//
//  Created by Amy Wong on 3/1/16.
//  Copyright © 2016 Amy Wong. All rights reserved.
//

import Foundation

class Task {
    
    var name: String
    var timeCompleted: NSDate?
    
    init() {
        name = ""
        timeCompleted = nil
    }
}