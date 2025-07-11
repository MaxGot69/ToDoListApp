//
//  TodoListApp.swift
//  TodoList
//
//  Created by Maxim Gotovchenko on 26.06.2025.
//
import FirebaseCore
import SwiftUI
import Firebase
@main
struct TodoListApp: App {
    init(){
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}
