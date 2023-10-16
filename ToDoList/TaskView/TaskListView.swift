//
//  TaskListView.swift
//  ToDoList
//
//  Created by Evgeny on 16.10.23.
//

import SwiftUI


struct TaskListView: View {
    @ObservedObject var viewModel: TaskViewModel
    @State private var newTaskName = ""

    var body: some View {
        NavigationView {
            List {
                HStack {
                    TextField("Enter a new task", text: $newTaskName)
                        .padding(.leading, 5)
                    
                    Button(action: {
                        viewModel.addTask(name: newTaskName)
                        newTaskName = ""
                    }) {
                        Text("Add")
                            .foregroundStyle(.blue)
                    }.padding(.trailing, 5)

                }.listRowSeparator(.hidden)
                    .padding(8)
                    .background(Color.white)
                    .cornerRadius(10)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.black, lineWidth: 1)
                    )

                ForEach(viewModel.tasks) { task in
                    TaskRowView(task: task, viewModel: viewModel)
                }
                .onDelete(perform: { indexSet in
                    for index in indexSet {
                        viewModel.deleteTask(task: viewModel.tasks[index])
                    }
                })
            }
            .listStyle(.plain)
            .navigationBarTitle("To-Do List")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        TaskListView(viewModel: TaskViewModel())
    }
}
