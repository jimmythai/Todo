//
//  TaskDescriptionTextFieldView.swift
//  Todo
//
//  Created by Atsushi Yamamoto on 2022/09/28.
//

import SwiftUI

struct TaskDescriptionTextFieldView: View {
    @Binding var description: String
    
    var body: some View {
        HStack(alignment: .top) {
            Text("Description")
                .frame(width: 90, alignment: .leading)
            TextEditor(text: $description)
                .padding(EdgeInsets(top: 2, leading: 4, bottom: 2, trailing: 4))
                .overlay(RoundedRectangle(cornerRadius: 10.0).strokeBorder(Color(.separator), style: StrokeStyle(lineWidth: 1.0)))
        }
    }
}

struct TaskDescriptionTextFieldView_Previews: PreviewProvider {
    @State static var description = "description"
    
    static var previews: some View {
        TaskDescriptionTextFieldView(description: $description)
    }
}
