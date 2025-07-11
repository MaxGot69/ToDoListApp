//
//  LoginViewViewModel.swift
//  TodoList
//
//  Created by Maxim Gotovchenko on 26.06.2025.
//

import Foundation
import FirebaseAuth

class LoginViewViewModel: ObservableObject{
    @Published var email = ""
    @Published var password = ""
    @Published var errorMessage = ""
    init(){}
    
    func login(){
        guard validate()else{
            return
        }
        // Try Log In
        Auth.auth().signIn(withEmail: email, password: password)
    }
    
    private func validate() -> Bool{
        errorMessage = ""
        guard !email.trimmingCharacters(in: .whitespaces).isEmpty, !password.trimmingCharacters(in: .whitespaces).isEmpty else {
            errorMessage = "Please fiil all fields."
            
            return false
        }
            guard email.contains("@") && email.contains(".") else{
                errorMessage = "Please enter valid email."
                return false
            }
        return true
    }
}
