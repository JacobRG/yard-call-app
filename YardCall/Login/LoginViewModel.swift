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
    @Published var isCreated = false
    @Published var errorMessage: String?
    @Published var shouldNavigateToDashboard = false
    @Published var shouldNavigateToOnboarding = false
    @Published var currentUser: User?
    
    func login(username: String, password: String) {
        guard !username.isEmpty else {
            errorMessage = "Please enter a username."
            return
        }
        guard !password.isEmpty else {
            errorMessage = "Please enter a password."
            return
        }

        var user = User(username: username, password: password, firstname: nil, lastname: nil, email: nil)
        LoginModel.validate(user: &user) { isValid, mutableUser in
            if isValid == true {
                self.isLoggedIn = true
                self.currentUser = mutableUser
                //self.dashboardViewModel.setCurrentUser(user: self.currentUser!)
                print("------HERE LoginViewModel------")
                print(self.currentUser?.firstname)
                print(self.currentUser?.lastname)
                print(self.currentUser?.email)
                self.shouldNavigateToDashboard = true
                print("------HERE LoginViewModel 2------")
                print(self.currentUser?.firstname)
                print(self.currentUser?.lastname)
                print(self.currentUser?.email)
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
        LoginModel.createAccount(user: newUser) { isValid in
            if isValid == true {
                self.isCreated = true
                self.shouldNavigateToOnboarding = true
            } else {
                self.errorMessage = "Unable to create account."
            }
        }
    }
}
