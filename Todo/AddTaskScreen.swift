//
//  AddTaskScreen.swift
//  Todo
//
//  Created by Atsushi Yamamoto on 2022/07/30.
//

import SwiftUI

struct AddTaskScreen: View {
    var taskStore: TaskStore
    
    @Environment(\.dismiss) private var dismiss
    @StateObject private var task = Task()
    
    var body: some View {
        let disabled = task.name.isEmpty
        
        NavigationView {
            VStack(alignment: .leading) {
                TaskNameTextFieldView(name: $task.name)
                TaskDescriptionTextFieldView(description: $task.description)
                    .scaledToFit()
                
                Button(action:  {
                    taskStore.add(task)
                    dismiss()
                }) {
                    HStack {
                        Spacer()
                        Text("Add")
                            .foregroundColor(.white)
                        Spacer()
                    }
                    .padding(20)
                    .background(.blue)
                    .cornerRadius(4)
                }
                .disabled(disabled)
                
                Spacer()
            }
            .padding(EdgeInsets(top: 0, leading: 16, bottom: 20, trailing: 16))
            .navigationTitle("Add a task")
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
            }
        }
        .navigationViewStyle(.stack)
    }
}

struct AddTaskScreen_Previews: PreviewProvider {
    static var previews: some View {
        AddTaskScreen(taskStore: .init())
    }
}
