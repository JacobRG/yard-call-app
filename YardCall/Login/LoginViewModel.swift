//
//  LoginViewModel.swift
//  YardCall
//
//  Created by Jacob Gambrell on 3/15/23.
//

import Foundation

class LoginViewModel: ObservableObject {
//    @Published var username = ""
//    @Published var password = ""
//    @Published var firstname = ""
//    @Published var lastname = ""
//    @Published var email = ""
    @Published var isLoggedIn = false
    @Published var errorMessage: String? = nil
    @Published var shouldNavigateToDashboard = false
    
    func login(username: String, password: String) {
        guard !username.isEmpty else {
            errorMessage = "Please enter a username."
            return
        }
        guard !password.isEmpty else {
            errorMessage = "Please enter a password."
            return
        }

        let user = User(username: username, password: password, firstname: nil, lastname: nil, email: nil)
        LoginModel.validate(user: user) { isValid in
            if isValid == true {
                self.isLoggedIn = true
                self.shouldNavigateToDashboard = true
            } else {
                self.errorMessage = "Incorrect username or password"
            }
        }
    }
    
    func createAccount(username: String, password: String, firstname: String, lastname: String, email: String) {
        guard !username.isEmpty else {
            errorMessage = "Please enter a username."
            return
        }
        guard !password.isEmpty else {
            errorMessage = "Please enter a password."
            return
        }
        guard !firstname.isEmpty else {
            errorMessage = "Please enter your first name."
            return
        }
        guard !lastname.isEmpty else {
            errorMessage = "Please enter your last name."
            return
        }
        guard !email.isEmpty else {
            errorMessage = "Please enter your email."
            return
        }
        
        let newUser = User(username: username, password: password, firstname: firstname, lastname: lastname, email: email)
        LoginModel.createAccount(user: newUser)
    }
}
