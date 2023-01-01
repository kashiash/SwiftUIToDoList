//
//  ToDoItem.swift
//  SwiftUIToDoList
//
//  Created by Simon Ng on 10/8/2022.
//

import Foundation

enum Priority: Int {
    case low = 0
    case normal = 1
    case high = 2
}

class ToDoItem: ObservableObject, Identifiable {
    var id = UUID()
    @Published var name: String = ""
    @Published var priority: Priority = .normal
    @Published var isComplete: Bool = false
    
    init(name: String, priority: Priority = .normal, isComplete: Bool = false) {
        self.name = name
        self.priority = priority
        self.isComplete = isComplete
    }
    
    static let example = ToDoItem(name: "Coś do zrobienia", priority: .normal, isComplete: false)
}

