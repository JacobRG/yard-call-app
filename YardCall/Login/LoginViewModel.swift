////
////  LoginViewModel.swift
////  YardCall
////
////  Created by Jacob Gambrell on 3/15/23.
////
//
//import Foundation
//
//class LoginViewModel: ObservableObject {
//    //    @Published var username = ""
//    //    @Published var password = ""
//    //    @Published var firstname = ""
//    //    @Published var lastname = ""
//    //    @Published var email = ""
//    @Published var isLoggedIn = false
//    @Published var isCreated = false
//    @Published var errorMessage: String?
//    @Published var shouldNavigateToDashboard = false
//    @Published var shouldNavigateToOnboarding = false
//    @Published var currentUser = User(id: "johndoe123", firstname: "john", lastname: "Doe", email: "johndoe@example.com", username: "johndoe", password: "password")
//
//
//    //private let sessionManager = SessionManager()
//
//    func login(email: String, password: String) {
//        guard !email.isEmpty else {
//            errorMessage = "Please enter a username."
//            return
//        }
//        guard !password.isEmpty else {
//            errorMessage = "Please enter a password."
//            return
//        }
//
//        let loginModel = LoginModel()
//        let sessionManager = SessionManager(loginModel: loginModel)
//        sessionManager.login(username: email, password: password) { result in
//            switch result {
//            case .success(let user):
//                //print("Logged in as \(user.email)")
//                self.shouldNavigateToDashboard = true
//                self.currentUser = user
//            case .failure(let error):
//                print("Login failed with error: \(error.localizedDescription)")
//                self.errorMessage = "Incorrect username or password"
//            }
//        }
//    }
//
//    func createAccount(username: String, password: String, firstname: String, lastname: String, email: String) {
//        guard !username.isEmpty else {
//            errorMessage = "Please enter a username."
//            return
//        }
//        guard !password.isEmpty else {
//            errorMessage = "Please enter a password."
//            return
//        }
//        guard !firstname.isEmpty else {
//            errorMessage = "Please enter your first name."
//            return
//        }
//        guard !lastname.isEmpty else {
//            errorMessage = "Please enter your last name."
//            return
//        }
//        guard !email.isEmpty else {
//            errorMessage = "Please enter your email."
//            return
//        }
//
//        let id = UUID().uuidString
//        let newUser = User(id: id, firstname: firstname, lastname: lastname, email: email, username: username, password: password)
//        FirebaseManager.shared.createUser(user: newUser) { error in
//            if let error = error {
//                self.errorMessage = "Unable to create account: \(error.localizedDescription)"
//            } else {
//                self.isCreated = true
//                self.shouldNavigateToOnboarding = true
//            }
//        }
//    }
//}
