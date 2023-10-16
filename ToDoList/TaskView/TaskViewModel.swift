//
//  TaskViewModel.swift
//  ToDoList
//
//  Created by Evgeny on 16.10.23.
//

import Foundation

class TaskViewModel: ObservableObject {
    @Published var tasks: [Task] = []

    init() {
        if let data = UserDefaults.standard.data(forKey: "tasks"),
           let savedTasks = try? JSONDecoder().decode([Task].self, from: data) {
            tasks = savedTasks
        }
    }

    func saveTasks() {
        if let encoded = try? JSONEncoder().encode(tasks) {
            UserDefaults.standard.set(encoded, forKey: "tasks")
        }
    }

    func addTask(name: String) {
        if name != "" {
            let task = Task(name: name)
            tasks.append(task)
            saveTasks()
        }
    }

    func toggleTaskCompletion(task: Task) {
        if let index = tasks.firstIndex(where: { $0.id == task.id }) {
            tasks[index].isCompleted.toggle()
            saveTasks()
        }
    }

    func deleteTask(task: Task) {
        tasks.removeAll { $0.id == task.id }
        saveTasks()
    }
}
