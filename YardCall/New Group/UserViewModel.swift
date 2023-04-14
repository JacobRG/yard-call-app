//
//  UserViewModel.swift
//  YardCall
//
//  Created by Jacob Gambrell on 4/13/23.
//

import Foundation
import FirebaseAuth
import Firebase
import FirebaseFirestoreSwift

class UserViewModel: ObservableObject {
    // MARK: State
    @Published var user: User?
    
    // MARK: Properties
    private let auth = Auth.auth()
    private let db = Firestore.firestore()
    var uuid: String? {
        auth.currentUser?.uid
    }
    var userIsAuthenticated: Bool {
        auth.currentUser != nil
    }
    var userIsAuthenticatedAndSynced: Bool {
        user != nil && self.userIsAuthenticated
    }
    
    // MARK: Firebase Auth Functions
    func signIn(email: String, password: String) {
        auth.signIn(withEmail: email, password: password) { [weak self] result, error in
            guard result != nil, error == nil else { return }
            // Successfully authenticated the user, now attempting to sync with Firestore
            DispatchQueue.main.async {
                self?.sync()
            }
            
        }
    }
    
    func signUp(email: String, firstName: String, lastName: String, username: String, password: String) {
        auth.createUser(withEmail: email, password: password) { [weak self] result, error in
            guard result != nil, error == nil else { return }
            DispatchQueue.main.async {
                //self?.user = User(id: (self?.uuid)!, firstname: firstName, lastname: lastName, email: email, username: username, password: password)
                self?.add(User(id: (self?.uuid)!, firstname: firstName, lastname: lastName, email: email, username: username, password: password, role: ""))
                self?.sync()
            }
        }
    }
    
    func signOut() {
        do {
            try auth.signOut()
            self.user = nil
        } catch {
            print("Error signing out the user: \(error)")
        }
    }
    
    // Firestore functions for User Data
    private func sync() {
        guard userIsAuthenticated else {
            return
        }
        db.collection("Users").document(self.uuid!).getDocument { (document, error) in
            guard document != nil, error == nil else {
                return
            }
            do {
                try self.user = document!.data(as: User.self)
            } catch {
                print("Sync error: \(error)")
            }
            
        }
    }
    
    private func add(_ user: User) {
        guard userIsAuthenticated else {
            return
        }
        do {
            let _ = try db.collection("Users").document(self.uuid!).setData(from: user)
        } catch {
            print("Error adding: \(error)")
        }
    }
    
    func update() {
        guard userIsAuthenticatedAndSynced else {
            return
        }
        do {
            let _ = try db.collection("Users").document(self.uuid!).setData(from: user)
        } catch {
            print("Error updating: \(error)")
        }
        
        
    }
}
