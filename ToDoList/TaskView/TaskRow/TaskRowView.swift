//
//  TaskRowView.swift
//  ToDoList
//
//  Created by Evgeny on 16.10.23.
//

import Foundation
import SwiftUI

struct TaskRowView: View {
    var task: Task
    @ObservedObject var viewModel: TaskViewModel

    var body: some View {
        HStack {
            Text(task.name)
            Spacer()
            Image(systemName: task.isCompleted ? "checkmark.square" : "square")
                .onTapGesture {
                    viewModel.toggleTaskCompletion(task: task)
                }
        }
    }
}
