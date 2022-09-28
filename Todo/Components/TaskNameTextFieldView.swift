//
//  TaskNameTextFieldView.swift
//  Todo
//
//  Created by Atsushi Yamamoto on 2022/09/28.
//

import SwiftUI

struct TaskNameTextFieldView: View {
    @Binding var name: String
    
    var body: some View {
        HStack(alignment: .top) {
            Text("Name")
                .frame(width: 90, alignment: .leading)
            TextField("", text: $name)
                .padding(EdgeInsets(top: 2, leading: 8, bottom: 2, trailing: 8))
                .frame(height: 44)
                .overlay(RoundedRectangle(cornerRadius: 10.0)
                    .strokeBorder(Color(.separator), style: StrokeStyle(lineWidth: 1.0)))
        }
    }
}
struct TaskNameTextFieldView_Previews: PreviewProvider {
    @State static var name = "name"
    
    static var previews: some View {
        TaskNameTextFieldView(name: $name)
    }
}
