//
//  CalendarView.swift
//  TaskChef
//
//  Created by Thomas Bahmandeji on 10/17/19.
//  Copyright © 2019 Thomas Bahmandeji. All rights reserved.
//

import SwiftUI

/// plus button that opens new entry
struct plusButton: View{
    @State var entrySheet = false
    
    var body: some View{
        
        Button(action:{
            self.entrySheet.toggle()
        }){
            Image(systemName: "plus.square")
        }.sheet(isPresented: $entrySheet){
            NewEntryView()
        }
    }
}

struct CalendarView: View {

    var body: some View{
        NavigationView{
            Text("Calendar")
                .navigationBarTitle(Text("Calendar"),displayMode: .inline)
            .navigationBarItems(trailing: plusButton().modifier(SymbolMod()))
        }
    }
}
