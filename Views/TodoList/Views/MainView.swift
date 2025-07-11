//
//  ContentView.swift
//  TodoList
//
//  Created by Maxim Gotovchenko on 26.06.2025.
//

import SwiftUI

struct MainView: View {
    @StateObject var viewModel = MainViewViewModel()
    
    var body: some View {
        if viewModel.isSignedIn, !viewModel.currentUserId.isEmpty{
            accountView
        }else{
            LoginIView()
        }
    }
    @ViewBuilder
    var accountView: some View{
        NavigationStack{
            TabView{
                ToDoListView(userId: viewModel.currentUserId )
                    .tabItem {
                        Label("Home", systemImage: "house")
                    }
                ProfileView()
                    .tabItem {
                        Label("Profile", systemImage: "person.circle")
                    }
            }
        }
    }
}
    
    #Preview {
        MainView()
    }

