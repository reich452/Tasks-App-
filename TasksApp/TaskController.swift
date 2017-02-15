//
//  TaskController.swift
//  TasksApp
//
//  Created by Nick Reichard on 2/15/17.
//  Copyright © 2017 Nick Reichard. All rights reserved.
//

import Foundation
import CoreData

class TaskController {
    
    static let sharedController = TaskController()
    
    var tasks: [Task] = []
    
    // MARK: - Create
    
    func add(taskWithName name: String, notes: String?, due: Date?) {
        
    }
    
    // MARK: - Read 
    
   
    
    // MARK: - Update 
    
    func update(task: Task, name: String, notes: String?, due: Date?) {
        
    }
    
    // MARK: - Delete 
    
    func remove(task: Task) {
        
    }
    
    // MARK: - Persistence
    
    func saveToPersistentStore() {
        
    }
    
    private func fetchTasks() -> [Task] {
      
        
    }
        
    

}
