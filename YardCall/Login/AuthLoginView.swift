//
//  AuthLoginView.swift
//  YardCall
//
//  Created by Jacob Gambrell on 4/5/23.
//

import SwiftUI
import Firebase

struct AuthLoginView: View {
    var body: some View {
        SignInView()
    }
}

struct SignInView: View {
    @EnvironmentObject var user: UserViewModel
    @State private var email: String = ""
    @State private var password: String = ""
    
    var body: some View {
        ZStack {
            Color(.lightGray).opacity(0.2).ignoresSafeArea()
            
            VStack {
                VStack(spacing: 20) {
                    Text("Welcome")
                    TextField("Email", text: $email)
                        .frame(width: 250, height: 50)
                        .background(Color.white)
                        .cornerRadius(12)
                        .autocapitalization(.none)
                    SecureField("Password", text: $password)
                        .frame(width: 250, height: 50)
                        .background(Color.white)
                        .cornerRadius(12)
                        .autocapitalization(.none)
                }
                .padding()
                
                Button("Sign in") {
                    user.signIn(email: email, password: password)
                }
                .frame(width: 250, height: 50)
                .background(Color.blue)
                .cornerRadius(12)
                .foregroundColor(Color.white)
                .padding()
                
                
                NavigationLink(destination: SignUpView()) {
                    Text("Don't have an account? Sign up").foregroundColor(Color.gray)
                }
            }
            .frame(width: 350, height: 380)
            .background(Color.white)
            .cornerRadius(25)
        }
    }
}

struct SignUpView: View {
    @EnvironmentObject var user: UserViewModel
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var firstname: String = ""
    @State private var lastname: String = ""
    @State private var username: String = ""
    
    var body: some View {
        ZStack {
            Color(.lightGray).opacity(0.2).ignoresSafeArea()
            
            VStack {
                VStack(spacing: 20) {
                    Text("Sign Up")
                    TextField("First name", text: $firstname)
                        .frame(width: 250, height: 50)
                        .background(Color.white)
                        .cornerRadius(12)
                        .disableAutocorrection(true)
                    TextField("Last Name", text: $lastname)
                        .frame(width: 250, height: 50)
                        .background(Color.white)
                        .cornerRadius(12)
                        .disableAutocorrection(true)
                    TextField("Email", text: $email)
                        .frame(width: 250, height: 50)
                        .background(Color.white)
                        .cornerRadius(12)
                        .autocapitalization(.none)
                        .disableAutocorrection(true)
                    TextField("Username", text: $username)
                        .frame(width: 250, height: 50)
                        .background(Color.white)
                        .cornerRadius(12)
                        .autocapitalization(.none)
                        .disableAutocorrection(true)
                    SecureField("Password", text: $password)
                        .frame(width: 250, height: 50)
                        .background(Color.white)
                        .cornerRadius(12)
                        .autocapitalization(.none)
                        .disableAutocorrection(true)
                }
                .padding()
                
                Button("Sign up") {
                    user.signUp(email: email, firstName: firstname, lastName: lastname, username: username, password: password)
                }
                .frame(width: 250, height: 50)
                .background(Color.blue)
                .cornerRadius(12)
                .foregroundColor(Color.white)
                .padding()
            }
            .frame(width: 350, height: 580)
            .background(Color.white)
            .cornerRadius(25)
        }
    }
}

struct AuthLoginView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
    }
}
