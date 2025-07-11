//
//  LoginIView.swift
//  TodoList
//
//  Created by Maxim Gotovchenko on 26.06.2025.
//

import SwiftUI

struct LoginIView: View {
@StateObject var viewModel = LoginViewViewModel()
    var body: some View {
        NavigationView{
            VStack  {
                //Header
                HeaderView(title: "To Do List", subtitle: "Get things Done", angle: 15, background: .red)
            
                
                Form{
                    if  !viewModel.errorMessage.isEmpty{
                        Text(viewModel.errorMessage)
                            .foregroundColor(Color.red)
                    }
                    
                    TextField("Email Address", text:$viewModel.email)
                        .textFieldStyle(DefaultTextFieldStyle())
                        .autocapitalization(.none)
                        
                    SecureField("Password", text:$viewModel.password)
                        .textFieldStyle(DefaultTextFieldStyle())
                    
                    TLButton(title: "Log in", background: .blue)
                    {
                        viewModel.login()
                    }
                    .padding()
                }
                
                .offset(y: -50)
                
                //Create account
                
                VStack{
                    Text("New around here?")
                    
                    NavigationLink("Create At Account",
                                   destination: RegisterView())
                }
                .padding(.bottom, 50)
                Spacer()
                
            }  }
        
    }
}

#Preview {
    LoginIView()
}
