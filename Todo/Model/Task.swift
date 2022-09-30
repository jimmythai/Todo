//
//  Task.swift
//  Todo
//
//  Created by Atsushi Yamamoto on 2022/09/28.
//

import Foundation

class Task: Identifiable, ObservableObject {
    let id = UUID()
    @Published var name = ""
    @Published var description = ""
    @Published var isCompleted = false
}
