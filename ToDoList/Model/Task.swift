//
//  Task.swift
//  ToDoList
//
//  Created by Evgeny on 16.10.23.
//

import Foundation

struct Task: Identifiable, Codable {
    var id = UUID()
    var name: String
    var isCompleted = false
}
