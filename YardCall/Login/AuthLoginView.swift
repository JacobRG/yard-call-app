//
//  AuthLoginView.swift
//  YardCall
//
//  Created by Jacob Gambrell on 4/5/23.
//

import SwiftUI
import Firebase

struct AuthLoginView: View {
    @ObservedObject var viewModel = AuthLoginViewModel()
    //@ObservedObject var sessionManager = SessionManager()
    @State var email = ""
    @State var password = ""
    @State var user: User?
    @State private var userIsLoggedIn = false
    
    @EnvironmentObject var dataManager: DataManager
    
    var body: some View {
        if userIsLoggedIn {
            LoadingView()
                .environmentObject(DataManager())
        } else {
            content
        }
    }
    
    var content: some View {
        ZStack {
            Color.blue
            
            VStack {
                TextField("Email", text: $email)
                    .autocapitalization(.none)
                SecureField("Password", text: $password)
                    .autocapitalization(.none)
                
                Button("Sign in") {
                    login()//user = viewModel.login(email: email, password: password)
                }
                
                Button("Already have an account? Login") {
                    register()
                }
                
//                NavigationLink(destination: DashboardView()/*.environmentObject(SessionManager())*/, isActive: $viewModel.shouldNavigateToDashboard) {
//                    EmptyView()
//                }
                
            }
            .padding()
            .onAppear {
                Auth.auth().addStateDidChangeListener { auth, user in
                    if user != nil {
                        userIsLoggedIn.toggle()
                    }
                }
            }
        }
    }
    
    func login() {
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if error != nil {
                print(error!.localizedDescription)
            }
        }
    }
    
    func register() {
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            print(error!.localizedDescription)
        }
    }
}

struct AuthLoginView_Previews: PreviewProvider {
    static var previews: some View {
        AuthLoginView()
            .environmentObject(DataManager())
    }
}
