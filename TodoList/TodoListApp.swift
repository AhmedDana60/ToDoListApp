//
//  TodoListApp.swift
//  TodoList
//
//  Created by Ahmed Dana Mohammed on 3/12/24.
//

/*
 MVVM Architecture
 
 Model - data print
 View - UI
 ViewModel - manages Models for View
 
 
 */



import SwiftUI

@main
struct TodoListApp: App {
   
    @StateObject var listViewModel: ListViewModel = ListViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ListView()
            }
            .navigationViewStyle(StackNavigationViewStyle())
            .environmentObject(listViewModel)
        }
    }
}
