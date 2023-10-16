//
//  ToDoListApp.swift
//  ToDoList
//
//  Created by Evgeny on 16.10.23.
//

import SwiftUI

@main
struct ToDoListApp: App {
    var body: some Scene {
        WindowGroup {
            TaskListView(viewModel: TaskViewModel())
        }
    }
}
