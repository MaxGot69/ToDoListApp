//
//  User.swift
//  TodoList
//
//  Created by Maxim Gotovchenko on 26.06.2025.
//

import Foundation

struct User: Codable{
    let id: String
    let name: String
    let email: String
    let joined: TimeInterval
}
