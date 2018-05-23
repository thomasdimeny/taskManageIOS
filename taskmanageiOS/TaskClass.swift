//
//  Tasks.swift
//  taskmanageiOS
//
//  Created by Thomas Dimeny on 5/10/18.
//  Copyright © 2018 Thomas Dimeny. All rights reserved.
//

import Foundation
import RealmSwift

class UserTask: Object {
    @objc dynamic var name = ""
   @objc dynamic var describe = ""
   @objc dynamic var complete = false
   @objc dynamic var date = ""

    }

