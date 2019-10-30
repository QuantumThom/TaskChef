//
//  SignInView.swift
//  TaskChef
//
//  Created by Thomas Bahmandeji on 10/17/19.
//  Copyright © 2019 Thomas Bahmandeji. All rights reserved.
//

import SwiftUI
import GoogleSignIn

struct SignInView : View {

    @State var email: String = ""
    @State var password: String = ""
    @State var loading = false
    @State var error = false
    
    @State var signUpSheet = false

    @EnvironmentObject var session: SessionStore
    
    func signIn () {
        loading = true
        error = false
        session.signIn(email: email, password: password) { (result, error) in
            self.loading = false
            if error != nil {
                self.error = true
            } else {
                self.email = ""
                self.password = ""
            }
        }
    }

    var body: some View {
        NavigationView {
            ZStack{
                session.MainTheme.edgesIgnoringSafeArea(.all)
//                Color.black
//                    .edgesIgnoringSafeArea(.all)
                VStack {
                    Spacer()
                    /// Sign in section
                    Button(action: {}){
                        Text("Welcome!").font(.system(size: 32)).font(.title)
                    }
                    
                    Button(action: {}){
                        TextField("email", text: $email)
                }.modifier(SignInModifier()).disableAutocorrection(true).keyboardType(.emailAddress).padding()
        
                    Button(action: {}){
                        SecureField("password", text: $password)
                    }.modifier(SignInModifier()).disableAutocorrection(true)
                    
                    if (error) {
                        Text("Invalid Username or Password").foregroundColor(Color.red)
                    }
                    
                    Button(action: signIn) {
                        Text("Log in").modifier(LogInModifier())
                    }
                    Text("or").padding(.top).foregroundColor(Color.gray)
                    
                    ///Google SignIn
                    //calls google sign in button and determines size with frame
                    Google()
                        .frame(width: 370, height: 150)
                    
                    Spacer()
                    
                    /// Sign up section
                    HStack {
                        Text("Dont have an account? ")
                        Button(action: {
                            self.signUpSheet.toggle()
                        }){
                            Text("Sign up.").foregroundColor(Color.blue)
                        }.sheet(isPresented: $signUpSheet){
                            SignUpView().environmentObject(SessionStore())
                        }
                    }.padding()
                }.padding()
            }
    }
    }
}

///Google sign in button
struct Google: UIViewRepresentable{
    func makeUIView(context: UIViewRepresentableContext<Google>) ->
        GIDSignInButton{
            let button = GIDSignInButton()
            button.colorScheme = .dark
            GIDSignIn.sharedInstance()?.presentingViewController = UIApplication.shared.windows.last?.rootViewController
            return button
    }
    
    func updateUIView(_ uiView: GIDSignInButton, context: UIViewRepresentableContext<Google>) {
        
    }
}
struct SignInView_Previews: PreviewProvider {
    static var previews : some View{
        SignInView().environmentObject(SessionStore())
    }
}

