//
//  ContentView.swift
//  MyTasks
//
//  Created by Ahmet Bostancıoğlu on 10.05.2025.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject private var viewModel = TaskListViewModel()
    
    @State private var isShowindAddTaskView = false
    
    var body: some View {
        NavigationView {
            ZStack {
                List {
                    ForEach(viewModel.taskList) { task in
                        HStack {
                            VStack(alignment: .leading) {
                                Text(task.title)
                                Text(task.description)
                                    .font(.caption)
                            }
                            Spacer()
                            Text(task.dueDate, style: .date)
                        }
                    }
                }
                VStack {
                    Spacer()
                    Button {
                        isShowindAddTaskView = true
                    } label: {
                        Image(systemName: "plus")
                            .font(.title)
                            .foregroundStyle(.white)
                            .frame(width: 70, height: 70)
                            .background(.green)
                            .clipShape(Circle())
                    }
                    .padding()
                    .sheet(isPresented: $isShowindAddTaskView) {
                        AddTaskView(viewModel: viewModel)
                    }
                }
            }
            .navigationTitle("MyTasks")
        }
    }
}

#Preview {
    ContentView()
}
