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
    @Published var users: [User] = []
    @Published var fetchedUser: User?
    
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
                self?.add(User(id: (self?.uuid)!, firstname: firstName, lastname: lastName, email: email, username: username, password: password, role: "", conversations: []))
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
                self.fetchAddress()
                self.fetchAllUsers()
                self.fetchConvos()
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
    
    func createConvo(_ conversation: Conversation) {
        let id = UUID().uuidString
        
        guard userIsAuthenticatedAndSynced else {
            return
        }
        do {
            let _ = try db.collection("Users").document(self.uuid!).collection("Conversations").document(id).setData(from: conversation)
        } catch {
            print("Error creating conversation: \(error)")
        }
    }
    
    func fetchConvos() {
        db.collection("Users").document(self.uuid!).collection("Conversations").addSnapshotListener() { (snapshot, error) in
            for document in snapshot!.documents {
                if let error = error {
                    print("Error getting users: \(error)")
                    return
                }
                let data = document.data()
                let id = data["id"] as! String //document.documentID
                let user1 = data["user1"] as! String
                let user2 = data["user2"] as! String

                // Check if the signUpDate field is a Timestamp
                if let thetimestamp = data["timestamp"] as? Timestamp {
                    let timestamp = thetimestamp.dateValue()
                    let conversation = Conversation(id: id, user1: user1, user2: user2, timestamp: timestamp)
                    self.user?.conversations.append(conversation)
                }
                // Otherwise, assume it's a Date
                else {
                    let timestamp = data["timestamp"] as! Date
                    let conversation = Conversation(id: id, user1: user1, user2: user2, timestamp: timestamp)
                    self.user!.conversations.append(conversation)
                }
            }
        }
    }
    
    func fetchUser(id: String) -> User {
        db.collection("Users").document(id).getDocument { (document, error) in
            if let error = error {
                print("Error getting users: \(error)")
                return
            }
            let data = document!.data()
            let id = document!.documentID
            let firstname = data!["firstname"] as! String
            let lastname = data!["lastname"] as! String
            let email = data!["email"] as! String
            let username = data!["username"] as! String
            let password = data!["password"] as! String
            let role = data!["role"] as! String
            self.fetchedUser = User(id: id, firstname: firstname, lastname: lastname, email: email, username: username, password: password, role: role, conversations: [])
        }
        return fetchedUser!
    }
    
    func fetchAllUsers() {
        db.collection("Users").addSnapshotListener() { (snapshot, error) in
            for document in snapshot!.documents {
                if let error = error {
                    print("Error getting users: \(error)")
                    return
                }
                let data = document.data()
                let id = document.documentID
                let firstname = data["firstname"] as! String
                let lastname = data["lastname"] as! String
                let email = data["email"] as! String
                let username = data["username"] as! String
                let password = data["password"] as! String
                let role = data["role"] as! String
                
                // Check if the signUpDate field is a Timestamp
                if let timestamp = data["signUpDate"] as? Timestamp {
                    let signUpDate = timestamp.dateValue()
                    let user = User(id: id, firstname: firstname, lastname: lastname, email: email, username: username, password: password, role: role, signUpDate: signUpDate, conversations: [])
                    self.users.append(user)
                }
                // Otherwise, assume it's a Date
                else {
                    let signUpDate = data["signUpDate"] as! Date
                    let user = User(id: id, firstname: firstname, lastname: lastname, email: email, username: username, password: password, role: role, signUpDate: signUpDate, conversations: [])
                    self.users.append(user)
                }
            }
        }
    }
    
    func fetchAddress() {
        db.collection("Users").document(self.uuid!).collection("Addresses").document(self.uuid!).getDocument { (document, error) in
            if let error = error {
                print("Error getting address: \(error)")
                return
            }
            let data = document!.data()
            let id = document!.documentID
            let address = data!["address"] as! String
            let city = data!["city"] as! String
            let postalcode = data!["postalcode"] as! String
            let region = data!["region"] as! String
            let streetnumber = data!["streetnumber"] as! String
            let unitnumber = data!["unitnumber"] as! String
            self.user?.address = Address(id: id, unitnumber: unitnumber, streetnumber: streetnumber, address: address, city: city, region: region, postalcode: postalcode)
        }
    }
}
