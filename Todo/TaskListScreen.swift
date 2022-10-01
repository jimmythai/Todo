//
//  TaskListScreen.swift
//  Todo
//
//  Created by Atsushi Yamamoto on 2022/07/15.
//

import SwiftUI

struct TaskListScreen: View {
    @StateObject var taskStore = TaskStore()
    
    var body: some View {
        NavigationView {
            ZStack {
                List {
                    // - Use core data to save tasks
                    
                    Section("Tasks") {
                        let incompletedTasks = $taskStore.tasks.filter { task in
                            !task.isCompleted.wrappedValue
                        }
                        
                        ForEach(incompletedTasks, id: \.id) { $task in
                            TaskItemView(taskStore: taskStore, task: $task)
                        }
                        .onDelete(perform: taskStore.remove)
                    }
                    
                    Section("Completed") {
                        let incompletedTasks = $taskStore.tasks.filter(\.isCompleted.wrappedValue)
                        
                        ForEach(incompletedTasks, id: \.id) { $task in
                            Text(task.name)
                        }
                        .onDelete(perform: taskStore.remove)
                    }
                }
                .listStyle(.plain)
                
                FloatingButtonView(taskStore: taskStore)
            }
            .padding(EdgeInsets(top: 0, leading: 0, bottom: 10, trailing: 0))
            .navigationTitle("Tasks")
        }
        .navigationViewStyle(.stack)
    }
}

struct TaskList_Previews: PreviewProvider {
    static var previews: some View {
        TaskListScreen()
    }
}

private struct TaskItemView: View {
    var taskStore: TaskStore
    @Binding var task: Task
    
    var body: some View {
        HStack {
            Button(action: {
                taskStore.complete(taskBy: task.id)
            }) {
                Image(systemName: "checkmark.circle")
            }
            .buttonStyle(.plain)
            
            NavigationLink(task.name) {
                TaskDetailsScreen(task: $task, remove: { _ in
                    taskStore.remove(taskBy: task.id)
                })
            }
            .buttonStyle(.plain)
        }
    }
}

private struct FloatingButtonView: View {
    var taskStore: TaskStore
    @State private var isAddTaskScreenPresented = false
    
    var body: some View {
        VStack {
            Spacer()
            
            HStack {
                Spacer()
                
                let width: CGFloat = 70
                
                Button {
                    isAddTaskScreenPresented = true
                } label: {
                    Image(systemName: "plus")
                        .font(.system(size: 22).bold())
                        .frame(width: width, height: width)
                        .foregroundColor(.white)
                }
                .sheet(isPresented: $isAddTaskScreenPresented, content: {
                    AddTaskScreen(taskStore: taskStore)
                })
                .background(.blue)
                .cornerRadius(width / 2)
                .padding()
                .shadow(color: .black.opacity(0.3), radius: 3, x: 3, y: 3)
            }
        }
    }
}
