//
//  NewEntryView.swift
//  TaskChef
//
//  Created by Thomas Bahmandeji on 10/20/19.
//  Copyright © 2019 Thomas Bahmandeji. All rights reserved.
//

import SwiftUI

struct NewEntryView: View{
    @State var sharedEmail = ""
    @State var title = ""
    @State var isDone = false
    
    func addEntry(){
        let task = Task(title: title, isDone: isDone, sharedEmail: sharedEmail)
    }
    var body: some View{
        VStack {
            
            TextField("Task name", text: $title)
            
            Button(action: {}){
                HStack{
                    Text("Share entry")
                    TextField("email", text: $sharedEmail).padding().border(Color.black).shadow(radius: 1)
                }
            }.padding()
            
            Button(action: {self.addEntry()}){
                Text("Create new Entry")
            }.modifier(LogInModifier())
            
//            Text("Options")
//            .contextMenu {
//                Button(action: {
//                    // change country setting
//                }) {
//                    Text("Choose Country")
//                }
//
//                Button(action: {
//                    // enable geolocation
//                }) {
//                    Text("Detect Location")
//                }
//            }
        }
    }
}
