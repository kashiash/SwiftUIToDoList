//
//  ToDoItem.swift
//  SwiftUIToDoList
//
//  Created by Simon Ng on 10/8/2022.
//

import Foundation
import SwiftUI
import CoreData

enum Priority: Int {
    case low = 0
    case normal = 1
    case high = 2
}

enum When: Int {
    case later = 0
    case today = 1
    case asap = 2
    case now = 3
    case date = 4
    
    /**
     * The name of the enumeration (as written in case).
     */
    var name: String {
        get { return String(describing: self) }
    }

    /**
     * The full name of the enumeration
     * (the name of the enum plus dot plus the name as written in case).
     */
    var description: String {
        get { return String(reflecting: self) }
    }
    
    func imageName() -> String{
        
        switch self {
        case .later: return "calendar.badge.exclamationmark"
        case .today: return "calendar.badge.exclamationmark"
        case .asap: return "clock.badge.exclamationmark"
        case .now: return "alarm.waves.left.and.right"
        case .date: return "clock.badge"
        }
    }
    
     func color() -> Color {
        switch self {
        case .later: return .blue
        case .today: return .green
        case .asap: return .orange
        case .now: return .red
        case .date: return .teal
        }
    }
    
}

public class ToDoItem: NSManagedObject {
    @NSManaged public var id: UUID
    @NSManaged public var name: String
    @NSManaged public var priorityNum: Int32
    @NSManaged public var whenNum: Int32
    @NSManaged public var isComplete: Bool
}

extension ToDoItem: Identifiable {

    var priority: Priority {
        get {
            return Priority(rawValue: Int(priorityNum)) ?? .normal
        }

        set {
            self.priorityNum = Int32(newValue.rawValue)
        }
    }
    
    var when: When {
        get {
            return When(rawValue: Int(whenNum)) ?? .later
        }

        set {
            self.whenNum = Int32(newValue.rawValue)
        }
    }
    
    
   
}



//class ToDoItem: ObservableObject, Identifiable {
//    var id = UUID()
//    @Published var name: String = ""
//    @Published var when: When = .later
//    @Published var priority: Priority = .normal
//    @Published var isComplete: Bool = false
//
//    init(name: String,when: When, priority: Priority = .normal, isComplete: Bool = false) {
//        self.name = name
//        self.when = when
//        self.priority = priority
//        self.isComplete = isComplete
//    }
//
//
//
//
//    static let example = ToDoItem(name: "Etiam condimentum molestie erat, at egestas sem aliquam eget. Aliquam sodales, dolor eu fringilla rutrum, elit massa suscipit mauris, a lobortis eros est sit amet mi. Pellentesque et sagittis massa. Donec vitae ex ut nibh hendrerit sagittis nec eget nunc. Aliquam erat volutpat. Proin eu augue eget velit convallis facilisis. Vivamus vel ultrices est. Nulla a elit at enim eleifend scelerisque. Duis egestas lorem a nunc rhoncus, ac consectetur est posuere. Aenean et dignissim nunc, ac porta diam. Cras pretium a libero pretium blandit.",when: .now, priority: .normal, isComplete: false)
//}

