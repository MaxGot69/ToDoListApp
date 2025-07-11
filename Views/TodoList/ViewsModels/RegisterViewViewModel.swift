import SwiftUI
import Foundation
import FirebaseAuth
import FirebaseFirestore

class RegisterViewViewModel: ObservableObject {
    @Published var name = ""
    @Published var email = ""
    @Published var password = ""
    var mainViewModel: MainViewViewModel?
    init(mainViewModel: MainViewViewModel? = nil) {
        self.mainViewModel = mainViewModel
    }
    
    func register() {
        // Валидация данных
        guard validate() else {
            return
        }
        
        // Регистрация через Firebase
        Auth.auth().createUser(withEmail: email, password: password) { [weak self] result, error in
            // Проверка на успешную регистрацию
            guard let userID = result?.user.uid else {
                return
            }
            // Вставка пользователя в базу
            self?.insertUserRecord(id: userID)
        }
    }
    
    // Функция вставки пользователя в базу данных (еще не реализована)
    private func insertUserRecord(id: String) {
        let newUser = User(id: id,
                           name: name,
                           email: email,
                           joined: Date().timeIntervalSince1970)
       let db = Firestore.firestore()
        db.collection("users")
            .document(id)
            .setData(newUser.asDictionary())
    }
    
    // Валидация данных
    private func validate() -> Bool {
        guard !name.trimmingCharacters(in: .whitespaces).isEmpty,
              !email.trimmingCharacters(in: .whitespaces).isEmpty,
              !password.trimmingCharacters(in: .whitespaces).isEmpty else {
            return false
        }
        
        guard email.contains("@") && email.contains(".") else {
            return false
        }
        
        guard password.count >= 6 else {
            return false
        }
        
        return true
    }
}
