//
//  ContentView.swift
//  TaskChef
//
//  Created by Thomas Bahmandeji on 10/17/19.
//  Copyright © 2019 Thomas Bahmandeji. All rights reserved.
//

import SwiftUI
 
// put other sign up or sign in methods heare
struct ContentView: View {
    
    @EnvironmentObject var session: SessionStore
    
    func getUser () {
        session.listen()
    }
    
    var body: some View {
        Group {
          if (session.session == nil) {
            SignInView()
          } else {
            TabbedView()
          }
        }.onAppear(perform: getUser)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(SessionStore())
    }
}


