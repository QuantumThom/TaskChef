//
//  ProfileView.swift
//  TaskChef
//
//  Created by Thomas Bahmandeji on 10/17/19.
//  Copyright © 2019 Thomas Bahmandeji. All rights reserved.
//

import SwiftUI
import Firebase

struct ProfileView: View {
    
    @EnvironmentObject var session: SessionStore
    
    func signOut () {
        session.signOut()
    }
    var body: some View {
        NavigationView{
            VStack {
                // Navigation items (settings, etc)
                Group{
                    NavigationLink(destination: SettingsView()){
                        HStack {
                            Image(systemName: "gear")
                            Text("Settings")
                        }//.modifier(ProfileMod())
                    }.modifier(ProfileMod())
                    
                    NavigationLink(destination: HelpView()){
                        HStack {
                            Image(systemName: "questionmark.square")
                            Text("Help")
                        }//.modifier(ProfileMod())
                    }.modifier(ProfileMod())
                    
                    NavigationLink(destination: PersonalInfoView()){
                        HStack {
                            Image(systemName: "person.2")
                            Text("Personal Info")
                        }//.modifier(ProfileMod())
                    }.modifier(ProfileMod())
                }
                .navigationBarTitle(Text("Profile"),displayMode: .inline)
                
                //Might make a thing like google that can save your accounts, but prolly not since its just a productivity app; not very useful
//                NavigationLink(destination: AccSwitch()){
//                    Text("Switch accounts").modifier(ProfileMod())
//                }
                Button(action: signOut){
                    Text("Sign out").modifier(LogInModifier())
                }
                
            }
        }
    }
}

// Modifier for all Navigation options in ProfileView (settings, etc.)

