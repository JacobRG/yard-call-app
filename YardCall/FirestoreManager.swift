//
//  FirestoreManager.swift
//  YardCall
//
//  Created by Jacob Gambrell on 4/4/23.
//

import Foundation
import Firebase

class FirestoreManager: ObservableObject {
    @Published var user: User = User(id: "johndoe123", firstname: "john", lastname: "Doe", email: "johndoe@example.com", username: "johndoe", password: "password")
    
    func fetchUser(email: String) async -> User? {
        let db = Firestore.firestore()
        let usersRef = db.collection("Users")
        let query = usersRef.whereField("email", isEqualTo: email)

        do {
            let snapshot = try await query.getDocuments()
            guard let document = snapshot.documents.first else { return nil }
            let data = document.data()
            let id = document.documentID
            let firstname = data["firstname"] as? String ?? ""
            let lastname = data["lastname"] as? String ?? ""
            let email = data["email"] as? String ?? ""
            let username = data["username"] as? String ?? ""
            let password = data["password"] as? String ?? ""
            self.user = User(id: id, firstname: firstname, lastname: lastname, email: email, username: username, password: password)
            print(user.firstname)
            return try? user
        } catch {
            print("Error getting documents: \(error)")
            return nil
        }
    }
}
