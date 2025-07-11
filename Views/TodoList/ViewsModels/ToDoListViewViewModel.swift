//
//  ToDoListViewViewModel.swift
//  TodoList
//
//  Created by Maxim Gotovchenko on 26.06.2025.
//
import FirebaseFirestore
import Foundation
/// To Do List for list of items
///Primaty Tab
class ToDoListViewViewModel: ObservableObject {
    @Published var showingNewItemView = false
    
    private let userId:String
    init(userId:String) {
        self.userId = userId
    }
    
    ///Delete to do list item
    /// - Parameter id: Item id to delete
    func delete(id:String){
        let db = Firestore.firestore()
        
        db.collection("users")
            .document(userId)
            .collection("todos")
            .document(id)
            .delete()
    }
}
