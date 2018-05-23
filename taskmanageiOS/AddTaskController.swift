//
//  AddTaskController.swift
//  taskmanageiOS
//
//  Created by Thomas Dimeny on 5/10/18.
//  Copyright © 2018 Thomas Dimeny. All rights reserved.
//

import UIKit

class AddTaskController:  UIViewController {
    var task = TaskManager.sharedInstance
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var describeTextField: UITextField!
    
    @IBOutlet weak var dateTextField: UITextField!
    
    
    @IBAction func saveButtonPressed(_ sender: Any) {
        var newTask = UserTask()
        newTask.describe = describeTextField.text!
        newTask.date = dateTextField.text!
        newTask.name = nameTextField.text!
        task.addTask(newTask)
          performSegue(withIdentifier: "unwindSegueToVC1", sender: self)
    }
    
    

    @IBAction func exitButtonTapped(_ sender: Any) {
        performSegue(withIdentifier: "unwindSegueToVC1", sender: self)

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
   // Add CommentCollapse
    
}
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

//}
