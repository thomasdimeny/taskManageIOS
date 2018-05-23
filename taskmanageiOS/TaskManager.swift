//
//  TaskManager.swift
//  taskmanageiOS
//
//  Created by Thomas Dimeny on 5/16/18.
//  Copyright © 2018 Thomas Dimeny. All rights reserved.
//

import Foundation
import RealmSwift

final class TaskManager {
    
    static let sharedInstance = TaskManager()
    
    private init() {
        tasks = realm.objects(UserTask.self)
    }
    
    let realm = try! Realm()
    
    
    var tasks: Results<UserTask>!
    
    func addTask(_ task: UserTask) {
        try! realm.write {
            realm.add(task)
        }
        
        
    }
    
    func getTaskCount() -> Int {
        return tasks.count
    }
    
    func getTask(index: Int) -> UserTask {
        return tasks[index]
    }
    
    

    func completeTask(index: Int) {
        tasks[index].complete = true
    }

    func deleteTask(_ task: UserTask) {
    try! realm.write {
        realm.delete(task)
    }
    }
    
}
