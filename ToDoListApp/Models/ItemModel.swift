//
//  ItemModel.swift
//  ToDoListApp
//
//  Created by JOYNAL ABEDIN on 26/10/22.
//

import Foundation

struct ItemModel: Identifiable {
    let id: String = UUID().uuidString
    let title: String
    let isCompleted: Bool
}
