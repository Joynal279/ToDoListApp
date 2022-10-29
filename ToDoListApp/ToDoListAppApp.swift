//
//  ToDoListAppApp.swift
//  ToDoListApp
//
//  Created by JOYNAL ABEDIN on 25/10/22.
//

import SwiftUI

@main
struct ToDoListAppApp: App {
    
    @StateObject var listViewModel: ListViewModel = ListViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ListView()
            }
            .environmentObject(listViewModel)
        }
    }
}
