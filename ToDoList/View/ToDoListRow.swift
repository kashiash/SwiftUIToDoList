//
//  ToDoListRow.swift
//  ToDoList
//
//  Created by Jacek Kosiński G on 01/01/2023.
//

import SwiftUI

struct ToDoListRow: View {
    @Environment(\.managedObjectContext) var context
    
    @ObservedObject var todoItem: ToDoItem
    
    var body: some View {
        Toggle(isOn: self.$todoItem.isComplete) {
            HStack {
                Text(self.todoItem.name)
                    .strikethrough(self.todoItem.isComplete, color: .black)
                    .bold()
                    .animation(.default)
                
                Spacer()
                
                Circle()
                    .frame(width: 10, height: 10)
                    .foregroundColor(self.color(for: self.todoItem.priority))
            }
        }
        .toggleStyle(CheckboxStyle())
        .onChange(of: todoItem, perform: { _ in
            if self.context.hasChanges {
                try? self.context.save()
            }
        })
    }
    
    private func color(for priority: Priority) -> Color {
        switch priority {
        case .high: return .red
        case .normal: return .orange
        case .low: return .green
        }
    }
}

//struct ToDoListRow: View {
//
//
//
//    @ObservedObject var todoItem: ToDoItem
//
//    @Environment(\.managedObjectContext) var context
//
//    var body: some View {
//        Toggle(isOn: self.$todoItem.isComplete) {
//            HStack {
//                Text(self.todoItem.name)
//                    .strikethrough(self.todoItem.isComplete, color: .black)
//                    .bold()
//                    .animation(.default)
//
//                Image(systemName: self.todoItem.when.imageName()).foregroundColor(self.todoItem.when.color())
//                Spacer()
//
//                Circle()
//                    .frame(width: 10, height: 10)
//                    .foregroundColor(self.color(for: self.todoItem.priority))
//            }
//        }.toggleStyle(CheckboxStyle())
//        .onChange(of: todoItem, perform: { _ in
//                if self.context.hasChanges {
//                    try? self.context.save()
//                }
//            })
//    }
//
//    private func color(for priority: Priority) -> Color {
//        switch priority {
//        case .high: return .red
//        case .normal: return .orange
//        case .low: return .green
//        }
//    }
//
//
//}


