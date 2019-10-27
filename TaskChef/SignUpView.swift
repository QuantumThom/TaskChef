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
    
    func signUp () {
        print("sign me up")
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
        VStack {
            TextField("email", text: $email).modifier(SignInModifier())
            
            SecureField("create a password", text: $password).modifier(SignInModifier())
            
            if (error) {
                Text("Invalid email address.").foregroundColor(Color.red)
            }
                Button(action: signUp){
                    Text("Register").modifier(LogInModifier())
                }
            
        }
        
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View{
        SignUpView()
    }
}


