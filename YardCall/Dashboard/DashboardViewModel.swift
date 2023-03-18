//
//  DashboardViewModel.swift
//  YardCall
//
//  Created by Jacob Gambrell on 3/18/23.
//

import Foundation
import Combine

class DashboardViewModel: ObservableObject {
    @Published var currentUser = User(username: "johndoe", password: "password", firstname: "John", lastname: "Doe", email: "johndoe@example.com")
    @Published var firstname = "John"
    @Published var lastname = "Doe"
    
    func getFirstName(user: User) -> String {
        setCurrentUser(user: user)
        return firstname
    }
    
    func setCurrentUser(user: User) {
        currentUser = user
        if let firstname = currentUser.firstname {
            self.firstname = firstname
        }
        if let lastname = currentUser.lastname {
            self.lastname = lastname
        }
        print("------HERE DashboardViewModel------")
        print(firstname)
        print(lastname)
    }
}

