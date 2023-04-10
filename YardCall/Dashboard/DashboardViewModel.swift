//
//  DashboardViewModel.swift
//  YardCall
//
//  Created by Jacob Gambrell on 3/18/23.
//

import Foundation
import Combine

class DashboardViewModel: ObservableObject {
    @Published var currentUser = User(id: "johndoe", firstname: "John", lastname: "Doe", email: "johndoe@example.com", username: "johndoe", password: "password")
    private let firestoreManager = FirestoreManager()
    //private var email = AuthLoginView().email
    
    func fetchUser(email: String) async throws {
        do {
            guard let user = await firestoreManager.fetchUser(email: email) else { return }
            DispatchQueue.main.async {
                print("right after")
                self.currentUser = user
                print("DashboardViewModel: \(self.currentUser.firstname)")
            }
        } catch {
            print("Error getting documents: \(error)")
        }
    }
}

