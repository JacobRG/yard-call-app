//
//  SessionManager.swift
//  YardCall
//
//  Created by Jacob Gambrell on 4/5/23.
//

import Foundation
import Firebase
import ScreenTime

class SessionManager: ObservableObject {
    @Published var currentUser: User?
    private let firestoreManager = FirestoreManager()
    private let viewModel = AuthLoginViewModel()
    
    init(currentUser: User? = nil) async {
        self.currentUser = await firestoreManager.fetchUser(email: AuthLoginView().email) 
    }
    
//    func fetchCurrentUser(email: String) async throws -> User? {
//        print("before")
//        do {
//            guard let user = await firestoreManager.fetchUser(email: email) else { return nil }
//            print("right after")
//            currentUser = user
//            print("Session CurrentUser: \(currentUser?.firstname)")
//            return user
//        } catch {
//            print("Error getting documents: \(error)")
//            return nil
//        }
//    }
}















//
//struct CurrentUser {
//    private let firestoreManager = FirestoreManager()
//    private let viewModel = AuthLoginViewModel()
//    
//    var currentUser: User?
//    
//    func fetchCurrentUser(email: String) async throws -> CurrentUser {
//        print("before")
//        guard let user = await firestoreManager.fetchUser(email: email) else { throw Error }
//        print("right after")
//        var updatedUser = self
//        updatedUser.currentUser = user
//        print("Session CurrentUser: \(currentUser?.firstname)")
//        return updatedUser
//    }
//}
