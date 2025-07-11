//
//  ToDoListItemsView.swift
//  TodoList
//
//  Created by Maxim Gotovchenko on 26.06.2025.
//

import SwiftUI

struct ToDoListItemsView: View {
    @StateObject var viewModel = ToDoListItemViewViewModel()
    let item: ToDoListItem
    
    var body: some View {
        HStack{
            VStack(alignment: .leading){
                Text(item.title)
                    .font(.body)
                    
                Text("\(Date(timeIntervalSince1970: item.dueDate). formatted(date:.abbreviated, time: .shortened))")
                    .font(.footnote)
                    .foregroundColor(Color(.secondaryLabel))
                
            }
            Spacer()
            
            Button {
                viewModel.toggleIsDone(item:item)
            } label: {
                Image(systemName: item.isDone ? "chekmark.circle.fill" : "circle")
                    .foregroundColor(Color.blue)
            }

        }
    }
}

#Preview {
    ToDoListItemsView()
}
