//
//  TaskStore.swift
//  Todo
//
//  Created by Atsushi Yamamoto on 2022/09/28.
//

import Foundation
import Combine

class TaskStore: ObservableObject {
    @Published var tasks: [Task] = []
    private var bag = [AnyCancellable]()

    func add(_ task: Task) {
        task.objectWillChange
            .sink { [weak self] in
                self?.objectWillChange.send()
            }
            .store(in: &bag)

        tasks.append(task)
    }
    
    func remove(taskAt offsets: IndexSet) {
        tasks.remove(atOffsets: offsets)
    }
    
    func complete(taskBy id: UUID) {
        let task = tasks.first { $0.id == id }
        task?.isCompleted = true
    }
    
    func remove(taskBy id: UUID) {
        guard let index = tasks.firstIndex(where: { $0.id == id }) else { return }
        
        tasks.remove(at: index)
    }
}
