//
//  ViewController.swift
//  taskmanageiOS
//
//  Created by Thomas Dimeny on 5/10/18.
//  Copyright © 2018 Thomas Dimeny. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    var taskManager = TaskManager.sharedInstance
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tableView.dataSource = self
        tableView.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return TaskManager.sharedInstance.getTaskCount()
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "taskCell") as! TaskTableViewCell
        cell.setUpCell(task: TaskManager.sharedInstance.getTask(index: indexPath.row))
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
    }

    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let currentTask = taskManager.getTask(index: indexPath.row)
        
        let finishTask = UITableViewRowAction(style: .normal, title: "Finish Task") { (_, _) in
            self.taskManager.completeTask(index: indexPath.row)
            tableView.reloadData()
        }
        
        let deleteAction = UITableViewRowAction(style: .destructive, title: "Delete") { (_, _) in
            self.taskManager.deleteTask(currentTask)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
        
        if currentTask.complete == nil {
            return [deleteAction,finishTask]
        }
        return [finishTask, deleteAction]
    }
    
    @IBAction func unwindToVC1(segue:UIStoryboardSegue) { }
    

}

