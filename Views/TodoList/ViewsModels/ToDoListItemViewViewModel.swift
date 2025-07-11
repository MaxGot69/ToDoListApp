//
//  ToDoListItemViewViewModel.swift
//  TodoList
//
//  Created by Maxim Gotovchenko on 26.06.2025.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore
/// To Do List for sigle To Do List Item view (each row in items list)
class ToDoListItemViewViewModel: ObservableObject {
    init() {}
    
    func toggleIsDone(item: ToDoListItem){
        var itemCopy = item
        itemCopy.setDone(!item.isDone)
        
        guard let uid = Auth.auth().currentUser?.uid else {
            return
        }
        
        let db = Firestore.firestore()
        db.collection("users")
            .document(uid)
            .collection("todos")
            .document(itemCopy.id)
            .setData(itemCopy.asDictionary())
    }
}
