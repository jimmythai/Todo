//
//  TaskListScreen.swift
//  Todo
//
//  Created by Atsushi Yamamoto on 2022/07/15.
//

import SwiftUI

class TaskStore: ObservableObject {
    @Published var tasks: [Task] = []
}

class Task: Identifiable, ObservableObject {
    let id = UUID()
    @Published var name = ""
    @Published var description = ""
    @Published var isCompleted = false
}

struct TaskListScreen: View {
    @State private var isAddTaskScreenPresented = false
    @StateObject var taskStore = TaskStore()

    var body: some View {
        NavigationView {
            ZStack {
                List {
                    ForEach($taskStore.tasks.filter { !$0.isCompleted.wrappedValue }, id: \.id) { $task in
                        HStack {
                            Button {
                                delete(itemBy: task.id) {
                                    task.isCompleted = true
                                }
                            } label: {
                                Image(systemName: "checkmark.circle")
                            }
                            .buttonStyle(.plain)

                            NavigationLink(task.name) {
                                TaskDetailsScreen(task: $task, remove: { _ in
                                    delete(itemBy: task.id)
                                })
                            }
                            .buttonStyle(.plain)
                        }
                    }
                    .onDelete(perform: delete)
                }
                .listStyle(.plain)
                
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
            .padding(EdgeInsets(top: 0, leading: 0, bottom: 10, trailing: 0))
            .navigationTitle("Tasks")
        }
        .navigationViewStyle(.stack)
    }
    
    private func delete(itemAt offsets: IndexSet) {
        taskStore.tasks.remove(atOffsets: offsets)
    }
    
    private func delete(itemBy id: UUID, completion: (() -> Void)? = nil) {
        guard let index = taskStore.tasks.firstIndex(where: { $0.id == id }) else { return }
        taskStore.tasks.remove(at: index)
    }
}

struct TaskList_Previews: PreviewProvider {
    static var previews: some View {
        TaskListScreen()
    }
}