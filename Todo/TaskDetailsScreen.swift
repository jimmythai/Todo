//
//  TaskDetailsScreen.swift
//  Todo
//
//  Created by Atsushi Yamamoto on 2022/07/15.
//

import SwiftUI

struct TaskDetailsScreen: View {
    @Environment(\.dismiss) private var dismiss
    @Binding var task: Task
    let remove: (() -> Void) -> Void

    var body: some View {
        VStack(alignment: .center) {
            TaskNameTextFieldView(name: $task.name)
            TaskDescriptionTextFieldView(description: $task.description)
                .scaledToFit()
            Spacer()
        }
        .padding(EdgeInsets(top: 0, leading: 16, bottom: 20, trailing: 16))
        .navigationTitle(task.name)
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem {
                Button("Delete") {
                    remove {
                        dismiss()
                    }
                }
            }
        }
    }
}

struct TaskDetails_Previews: PreviewProvider {
    static var previews: some View {
        TaskDetailsScreen(task: .init(projectedValue: .constant(.init())), remove: { _ in })
    }
}
