//
//  RegisterView.swift
//  TodoList
//
//  Created by Maxim Gotovchenko on 26.06.2025.
//

import SwiftUI

struct RegisterView: View {
        @StateObject var viewModel = RegisterViewViewModel()
    @EnvironmentObject var mainViewModel: MainViewViewModel
    
    var body: some View {
        VStack  {
            //Header
            HeaderView(title: "Register", subtitle: "Start organizing todos", angle: -15, background: .orange)
            
            Form{
                TextField("Full name", text:$viewModel.name)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .autocorrectionDisabled()

                TextField("Email address", text:$viewModel.email)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .autocapitalization(.none)
                    .autocorrectionDisabled()
                
                TextField("Password", text:$viewModel.password)
                    .textFieldStyle(DefaultTextFieldStyle())
                
                TLButton(
                    title: "Create Account",
                    background: .green)
                {
                    viewModel.register()
                    
                }
                .padding()
            }
            .offset(y: -50)
            
            Spacer()
        }
    }
}

#Preview {
    RegisterView()
}
