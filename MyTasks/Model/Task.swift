//
//  Task.swift
//  MyTasks
//
//  Created by Ahmet Bostancıoğlu on 10.05.2025.
//

import SwiftUI

struct Task: Identifiable, Codable {
    var id = UUID()
    var title: String
    var description: String
    var dueDate: Date
    var isDone = false
}
