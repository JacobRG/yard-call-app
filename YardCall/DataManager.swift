//
//  DataManager.swift
//  YardCall
//
//  Created by Jacob Gambrell on 4/7/23.
//

import Foundation
import Firebase

class DataManager: ObservableObject {
    @Published var user = User(id: "johndoe", firstname: "John", lastname: "Doe", email: "johndoe@example.com", username: "johndoe", password: "password")
    
    init() {
        fetchUser()
    }
    
    func fetchUser() {
        let db = Firestore.firestore()
        let ref = db.collection("Users")
        ref.getDocuments { snapshot, error in
            guard error == nil else {
                print(error!.localizedDescription)
                return
            }
            
            if let snapshot = snapshot {
                for document in snapshot.documents {
                    let data = document.data()
                    
                    let id = document.documentID
                    let firstname = data["firstname"] as? String ?? ""
                    let lastname = data["lastname"] as? String ?? ""
                    let email = data["email"] as? String ?? ""
                    let username = data["username"] as? String ?? ""
                    let password = data["password"] as? String ?? ""
                    
                    let user = User(id: id, firstname: firstname, lastname: lastname, email: email, username: username, password: password)
                    self.user = user
                }
            }
        }
    }
}
