//
//  ProfileViewViewModel.swift
//  TodoList
//
//  Created by Maxim Gotovchenko on 26.06.2025.
//
import FirebaseFirestore
import FirebaseAuth
import Foundation
class ProfileViewViewModel: ObservableObject {
    init() {}
    
    @Published var user: User? = nill
    
    func fetchUser(){
        guard let userId = Auth.auth().currentUser?.uid else {
            return
        }
        let db = Firestore.firestore()
        db.collection("users").document(userId).getDocument{ [weak self]snapshot, error in
            guard let data = snapshot?.data(), error == nill else {
                return
            }
            DispatchQueue.main.async{
                self?.user = User(id: data["id"] as? String ?? "",
                                  name: data["name"] as? String ?? "",
                                  email: data["email"] as? String ?? "",
                                  joined: data["joined"] as? TimeInterval ?? 0)
                    
                
            }
        }
    }
    func logOut(){
        do {
            try Auth.auth().signOut()
        }catch{
            print(error)
        }
    }
}
