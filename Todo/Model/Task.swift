//
//  Task.swift
//  Todo
//
//  Created by Atsushi Yamamoto on 2022/09/28.
//

import Foundation

protocol TaskEntity {
    var id: UUID { get }
    var name: String { get set }
    var description: String { get set }
    var isCompleted: Bool { get set }
}

class Task: TaskEntity, Identifiable, ObservableObject {
    let id = UUID()
    @Published var name = ""
    @Published var description = ""
    @Published var isCompleted = false
}
