//
//  ToDoView.swift
//  TaskChef
//
//  Created by Thomas Bahmandeji on 10/18/19.
//  Copyright © 2019 Thomas Bahmandeji. All rights reserved.
//

import SwiftUI

struct ToDoView: View {
    var body: some View{
        NavigationView{
            List{
                Text("placeHolder")
            }
                .navigationBarTitle(Text("To-Do"),displayMode: .inline)
            .navigationBarItems(trailing: plusButton().modifier(SymbolMod()))
        }
    }
}
