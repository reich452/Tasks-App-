//
//  Task+Convenience.swift
//  TasksApp
//
//  Created by Nick Reichard on 2/15/17.
//  Copyright © 2017 Nick Reichard. All rights reserved.
//

import Foundation

import CoreData

extension Task {
    
    @discardableResult convenience init(name: String, notes: String? = nil, due: NSDate? = nil, isComplete: Bool, context: NSManagedObjectContext = CoreDataStack.context) {
        
    // This is saying that we want to put this new instance of Song in a specific managed object context (sandbox or scratchpad)
        
        self.init(context: context)
        
        self.name = name
        self.notes = notes
        self.due = due as NSDate?
        self.isComplete = isComplete 
        
    }
    
}
