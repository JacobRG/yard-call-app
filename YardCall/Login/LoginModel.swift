//
//  LoginModel.swift
//  YardCall
//
//  Created by Jacob Gambrell on 3/15/23.
//

import Foundation
import Firebase

struct User {
    let username: String
    let password: String
    let firstname: String?
    let lastname: String?
    let email: String?
}

class LoginModel {
    
    static let db = Firestore.firestore()
    
    static func validate(user: User, completion: @escaping (Bool) -> Void) {
        
        let usersRef = db.collection("Users")
        
        // Check for a document that matches the given username and password
        usersRef.whereField("username", isEqualTo: user.username)
            .whereField("password", isEqualTo: user.password)
            .getDocuments { (snapshot, error) in
                
                // If there was an error, return false and print the error message
                if let error = error {
                    print("Error getting documents: \(error.localizedDescription)")
                    completion(false)
                }
                
                // If there was no error and there is at least one matching document, return true
                if let snapshot = snapshot, !snapshot.isEmpty {
                    completion(true)
                }
                
                // If there was no error but no documents match, return false
                completion(false)
            }
    }
    
    static func createAccount(user: User) {
        guard !user.username.isEmpty else {
            return
        }
        
        db.collection("Users").document(user.username).setData([
            "firstname": user.firstname,
            "lastname": user.lastname,
            "username": user.username,
            "password": user.password,
            "email": user.email
        ]) { err in
            if let err = err {
                print("Error adding document: \(err)")
            } else {
                print("Document added with ID")
            }
        }
    }
}
