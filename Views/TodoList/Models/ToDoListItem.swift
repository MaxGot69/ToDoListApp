//
//  ToDoListItem.swift
//  TodoList
//
//  Created by Maxim Gotovchenko on 26.06.2025.
//

import Foundation

struct ToDoListItem: Identifiable{
    let id: String
    let title: String
    let  dueDate: TimeInterval
    let createDate: TimeInterval
    var isDone: Bool
    
    
        
        mutating func setDone(_ state: Bool){
            isDone = state
        }
    }

