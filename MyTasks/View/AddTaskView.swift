//
//  AddTaskView.swift
//  MyTasks
//
//  Created by Ahmet Bostancıoğlu on 10.05.2025.
//

import SwiftUI

struct AddTaskView: View {
    
    @Environment(\.dismiss) var dismiss
    @ObservedObject var viewModel: TaskListViewModel
    
    @State private var taskTitleInput = String()
    @State private var taskDescriptionInput = String()
    @State private var taskDueDateInput = Date()
    
    var body: some View {
        NavigationView {
            ZStack {
                Form {
                    TextField("Title", text: $taskTitleInput)
                    TextField("Description", text: $taskDescriptionInput)
                    
                    DatePicker("Due Date", selection: $taskDueDateInput)
                }
                VStack {
                    Spacer()
                        Button {
                            let newTask = Task(title: taskTitleInput, description: taskDescriptionInput, dueDate: taskDueDateInput)
                            viewModel.taskList.append(newTask)
                            dismiss()
                        } label: {
                            Text("Add")
                                .font(.title3)
                                .foregroundStyle(.white)
                                .frame(width: 150, height: 60)
                                .background(.green)
                                .clipShape(.capsule)

                        }
                        .padding(.bottom)
                    }
            }
            .navigationTitle("Add Task")
        }
    }
}

#Preview {
    AddTaskView(viewModel: TaskListViewModel())
}
