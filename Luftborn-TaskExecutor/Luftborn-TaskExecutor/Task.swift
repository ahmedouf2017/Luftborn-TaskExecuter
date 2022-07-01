//
//  Task.swift
//  Luftborn-TaskExecutor
//
//  Created by Ahmed Ouf on 01/07/2022.
//

import Foundation

class Task{
    var startTime: String = ""
    var taskName: String = ""
    var taskTag: Int64 = 0
    
    init(startTime: String, taskName: String, taskTag: Int64) {
        self.startTime = startTime
        self.taskName = taskName
        self.taskTag = taskTag
    }
    
}
