//
//  TaskDetailTableViewController.swift
//  TasksApp
//
//  Created by Nick Reichard on 2/15/17.
//  Copyright © 2017 Nick Reichard. All rights reserved.
//

import UIKit

class TaskDetailTableViewController: UITableViewController {
    
    // MARK: - Outlets
    
    @IBOutlet weak var taskNameTextField: UITextField!
    @IBOutlet weak var dueDateTextField: UITextField!
    @IBOutlet weak var notesTextView: UITextView!
    @IBOutlet weak var dueDatePicker: UIDatePicker!
    
    

    var dueDateValue: Date? = Date() // Puting in todays date as defalt
    
    var task: Task? {
        didSet {
            updateViews()
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dueDateTextField.inputView = dueDatePicker
        
        updateViews()
    }
    
    // Go back to your updateViews() function and use task.due.stringValue() to set the text for the due label (you may have to cast task.due to Date first)
    
    func updateViews() {
        
        guard let task = self.task else { return }
        
        let stringDate = task.due as Date?
        
        self.taskNameTextField.text = task.name
        self.dueDateTextField.text = stringDate?.stringValue()
        self.notesTextView.text = task.notes
        
        
    }
    
    
    // MARK: - Actions
    
    @IBAction func saveButtonTapped(_ sender: Any) {
        
        guard let name = taskNameTextField.text else { return }
        
        let notes = notesTextView.text
        let due = dueDateValue
        
        if let task = self.task {
            TaskController.sharedController.update(task: task, name: name, notes: notes, due: due)
        } else {
            TaskController.sharedController.add(taskWithName: name, notes: notes, due: due)
        }
        
        _ = navigationController?.popViewController(animated: true)
    }
    
    
    @IBAction func cancelButtonTapped(_ sender: Any) {
        _ = navigationController?.popViewController(animated: true)
    }
    
    @IBAction func datePickerValueChanged(_ sender: UIDatePicker) {
        self.dueDateTextField.text = sender.date.stringValue()
        self.dueDateValue = dueDatePicker.date
    }
    
    @IBAction func userTappedView(_ sender: Any) {
        self.taskNameTextField.resignFirstResponder()
        self.dueDateTextField.resignFirstResponder()
        self.notesTextView.resignFirstResponder()
    }
    
    // Why do this?
    func updateTask() {
        
        
    }
    
    
}

