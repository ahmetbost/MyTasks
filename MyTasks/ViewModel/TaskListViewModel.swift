//
//  TaskListViewModel.swift
//  MyTasks
//
//  Created by Ahmet Bostancıoğlu on 10.05.2025.
//

import Foundation

class TaskListViewModel: ObservableObject {
    @Published var taskList: [Task] = [] {
        didSet {
            saveTasks()
        }
    }
    
    init() {
        loadTasks()
    }
    
    private let saveKey = "TaskListData"
    
    private func saveTasks() {
        if let encoded = try? JSONEncoder().encode(taskList) {
            UserDefaults.standard.set(encoded, forKey: saveKey)
        }
    }
    
    private func loadTasks() {
        if let data = UserDefaults.standard.data(forKey: saveKey) {
            let decoded = try? JSONDecoder().decode([Task].self, from: data)
            taskList = decoded ?? []
        }
    }
}
