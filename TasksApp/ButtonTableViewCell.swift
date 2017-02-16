//
//  ButtonTableViewCell.swift
//  TasksApp
//
//  Created by Nick Reichard on 2/15/17.
//  Copyright © 2017 Nick Reichard. All rights reserved.
//

import UIKit

class ButtonTableViewCell: UITableViewCell {
    @IBOutlet weak var primaryLabel: UILabel!
    @IBOutlet weak var completeButton: UIButton!
    
    var delegate: ButtonTableViewCellDelegate?
    
    // MARK: - Action
    
    @IBAction func buttonTapped(_ sender: Any) {
        delegate?.buttonCellButtonTapped(self)
    }
    
    func updateButton(_ isComplete: Bool) {
        let imageName = isComplete ? "complete" : "incomplete"
        completeButton.setImage(UIImage(named: imageName), for: .normal)
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        
    }
    
}

extension ButtonTableViewCell {
    
    // updates the label to the name of the task and calls the dateButton(_ isComplete: Bool) function to update the image
    
    func update(withTask task: Task) {
        primaryLabel.text = task.name
        updateButton(task.isComplete)
        
    }
}

// To delegate handling a button tap to the TaskListTableViewController, adopt the protocol, and use the delegate method to mark the task as complete and reload the cell.

protocol ButtonTableViewCellDelegate {
    func buttonCellButtonTapped(_ sender: ButtonTableViewCell)
    
}

