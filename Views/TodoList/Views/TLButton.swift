//
//  TLButton.swift
//  TodoList
//
//  Created by Maxim Gotovchenko on 30.06.2025.
//

import SwiftUI

struct TLButton: View {
    let title: String
    let background: Color
    let action: ()-> Void
    var body: some View {
        Button {
            action()
        } label: {
            ZStack{
                RoundedRectangle(cornerRadius: 30)
                    .foregroundColor(background)
                
                Text(title)
                    .foregroundColor(Color.white)
                    .bold()
            }
        }
    }
}

#Preview {
    TLButton(title: "Value", background: .pink){
        //Action
    }
}
