//
//  AuthLoginViewModel.swift
//  YardCall
//
//  Created by Jacob Gambrell on 4/5/23.
//

import Foundation
import Firebase

class AuthLoginViewModel: ObservableObject {
    @Published var shouldNavigateToDashboard = false
    @Published var isLoggedIn = false
    @Published var currentUser: User?
    
    func login(email: String, password: String) -> User? {
        var user: User?
        Auth.auth().signIn(withEmail: email, password: password) { [self] (result, error) in
            if error != nil {
                print(error?.localizedDescription ?? "")
            } else {
                print("success")
                Task {
                    try await DashboardViewModel().fetchUser(email: email)
                    DispatchQueue.main.async {
                        print(DashboardViewModel().currentUser.firstname)
                        print("Login Func: \(currentUser?.firstname)")
                        self.isLoggedIn = true
                        self.shouldNavigateToDashboard = true
                        print("VIEW LOADED")
                    }
                }
            }
        }
        return user
    }
}
