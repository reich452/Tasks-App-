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
    
    // MARK: - Properties 
    
    var tasks: [Task] = []
    
    
    // MARK: - MOCK Data 
    
    var mockTasks: [Task] {
        return [Task(name: "Task1", isComplete: false),
                Task(name: "Task2", isComplete: false),
                Task(name: "Task3", isComplete: false)]
        
    }
    
    init() {
        self.tasks = mockTasks
    }
    
    
    
    
    // MARK: - Create
    
    func add(taskWithName name: String, notes: String?, due: Date?) {
        
    }
    
    
    
    
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
        let request: NSFetchRequest<Task> = Task.fetchRequest()
        let moc = CoreDataStack.context
        
        do {
            return try moc.fetch(request)
        } catch {
            print("Error loading tasks from managed object context")
            return []
        }
        
    }
    
}
