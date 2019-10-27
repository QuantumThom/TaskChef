//
//  HomeView.swift
//  TaskChef
//
//  Created by Thomas Bahmandeji on 10/17/19.
//  Copyright © 2019 Thomas Bahmandeji. All rights reserved.
//

import SwiftUI

struct HomeView: View {
    var body: some View{
        NavigationView{
            List{
                Text("Home List item")
            }
            .navigationBarTitle(Text("TaskChef"),displayMode: .inline)
            .navigationBarItems(trailing: plusButton()).modifier(SymbolMod()).padding()
        }
    }
}

struct TabbedView: View {
    @EnvironmentObject var session: SessionStore
    
    var body: some View{
        TabView{
            
            HomeView()
                .tabItem(){
                    Image(systemName: "house").modifier(SymbolMod())
                    Text("Home")
            }.tag(0)
            
            CalendarView()
                .tabItem(){
                    Image(systemName: "calendar").modifier(SymbolMod())
                    Text("Calendar")
            }.tag(1)
            
            ToDoView()
                .tabItem(){
                    Image(systemName: "doc.plaintext").modifier(SymbolMod())
                    Text("To-Do")
            }.tag(2)
            
            ProfileView()
                .tabItem(){
                    Image(systemName: "person").modifier(SymbolMod())
                    Text("Profile")
            }.tag(3)
            
        }
    }
}

struct HomeView_Previes: PreviewProvider {
    static var previews: some View{
        TabbedView()
    }
}
