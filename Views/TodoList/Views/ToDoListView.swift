//
//  ToDoListItemView.swift
//  TodoList
//
//  Created by Maxim Gotovchenko on 26.06.2025.
//
import FirebaseFirestoreSwift
import SwiftUI

struct ToDoListView: View {
    @State var viewModel: ToDoListViewViewModel
    @FirestoreQuery var items: [ToDoListItem]
    
    init(userId: String){
        
        self._items = FirestoreQuery(
            collectionPath: "users\/(userId)/todos"
        )
        self._viewModel = StateObject(wrappedValue: ToDoListViewViewModel(userId:userId)
        )
    }
    
    var body: some View {
        NavigationView {
            VStack{
                List(items){ item in
                    ToDoListItemsView(item:item)
                        .swipeActions {
                            Button("Delete"){
                                viewModel.delete(id: item.id)
                            }
                            .tint(.red)
                        }
                    
                }
                .listStyle(PlainListStyle())
            }
            .navigationTitle("To Do List")
            .toolbar {
                Button {
                    //Action
                    viewModel.showingNewItemView = true
                } label: {
                    Image(systemName: "plus")
                }
                
            }
            
            .sheet(isPresented: $viewModel.showingNewItemView){
                NewItemView(newItemPresented: $viewModel.showingNewItemView)
            }
        }
        
    }
}

#Preview {
    ToDoListView(userId: "")
}
