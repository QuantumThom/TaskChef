//
//  SignUpView.swift
//  TaskChef
//
//  Created by Thomas Bahmandeji on 10/17/19.
//  Copyright © 2019 Thomas Bahmandeji. All rights reserved.
//

import SwiftUI

struct SignUpView: View {
    @State var email: String = ""
    @State var password: String = ""
    @State var rePassword: String = ""
    @State var loading = false
    @State var error = false
    
    @EnvironmentObject var session: SessionStore
    @Environment(\.presentationMode) var presentationMode

    func signUp () {
        print("sign up worked")
        loading = true
        error = false
        session.signUp(email: email, password: password) { (result, error) in
            self.loading = false
            if error != nil {
                print("\(self.error)")
                self.error = true
            } else {
                self.email = ""
                self.password = ""
            }
        }
    }
    
    var body: some View{
        ZStack{
            //RGB: (101,119,134) - Dark Gray
            //RGB: (29,161,242) - Light Blue (Twitter).
            //Color(red: 0.3, green: 0.6, blue: 0.99).edgesIgnoringSafeArea(.all)
            session.ThemeColor.edgesIgnoringSafeArea(.all)
            VStack {
                
                Text("Register").font(.largeTitle).offset(y: 0)
                
                Button(action: {}){
                    TextField("email", text: $email)
                    }.modifier(SignInModifier()).padding()
                
                Button(action:{}){
                    SecureField("create a password", text: $password)
                }.modifier(SignInModifier()).padding(.bottom)
                
                if (error) {
                    Text("Invalid email address or password.").foregroundColor(Color.red)
                }
                
                Button(action: signUp){
                    Text("Sign up").modifier(LogInModifier())
                }
                
            }
        }
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View{
        SignUpView()
    }
}


