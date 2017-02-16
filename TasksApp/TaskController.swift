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
    
    // MARK: Fetch
    
    let fetchedResultsController: NSFetchedResultsController<Task>
    
    init() {
        
        // Make the request (remember which model class you want to fetch)
        let request: NSFetchRequest<Task> = Task.fetchRequest()
        
        
        // Optionally make a sort descriptor to sorte the request by timestamp, and add it to the request
        let sortDescriptor = NSSortDescriptor(key: "isComplete", ascending: false)
        
        request.sortDescriptors = [sortDescriptor]
        
        
        // set self.fetchedResultsController equal to a new instance of NSFetcheResultSController. (set sectionNameKeyPath and cachName to nil) Ask yoself; "where is the managed object context"
        let moc = CoreDataStack.context
        
        self.fetchedResultsController = NSFetchedResultsController(fetchRequest: request, managedObjectContext: moc, sectionNameKeyPath: "isComplete", cacheName: nil)
        
        
        // Peform the fetch request through  the fetech resultsController in a do-try-catch block
        
        do {
            try self.fetchedResultsController.performFetch()
        } catch {
            print("Could not fetch Tasks from MOC through FRC")
        }
    }
    
    
    // MARK: - Create
    
    func add(taskWithName name: String, notes: String?, due: Date?) {
        
        let _ = Task(name: name, notes: notes, due: due)
        saveToPersistentStore()
        
    }
    
    // MARK: - Update
    
    func update(task: Task, name: String, notes: String?, due: Date?) {
        task.name = name
        task.notes = notes
        task.due = due as NSDate?
        saveToPersistentStore()
        
        
    }
    
    // MARK: - Delete
    
    func remove(task: Task) {
        // We need to get the index of the Task that we pass in from the array of Tasks in order to delete the right taks
        let moc = CoreDataStack.context   ///Going to our MOC and deleting an object
        moc.delete(task)               // Going to our Persisten Store - Deleting one less objec
        saveToPersistentStore()
    }
    
    func toggleIsCompleteFor(task: Task) {
        task.isComplete = !task.isComplete
        saveToPersistentStore()
    }
    
    // MARK: - Persistence
    
    func saveToPersistentStore() {
        
        let moc = CoreDataStack.context
        
        do {
            try moc.save()
        } catch {
            print("There was an error saving to the persistent store")
        }
    }
    
}
