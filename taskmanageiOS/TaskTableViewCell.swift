//
//  TaskTableViewCell.swift
//  taskmanageiOS
//
//  Created by Thomas Dimeny on 5/16/18.
//  Copyright © 2018 Thomas Dimeny. All rights reserved.
//

import UIKit

class TaskTableViewCell: UITableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    @IBOutlet weak var completeLabel: UILabel!
    
  
    
    
    func setUpCell(task: UserTask){
        nameLabel.text = task.name
        dateLabel.text = task.date
        if task.complete == false {
            completeLabel.text = "Not complete"
            completeLabel.backgroundColor = #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)
            } else {
            completeLabel.text = "Complete"
            completeLabel.backgroundColor = #colorLiteral(red: 1, green: 0.2199089527, blue: 0.252465874, alpha: 1)
        }
    }

}
