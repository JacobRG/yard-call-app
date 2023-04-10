////
////  LoginModel.swift
////  YardCall
////
////  Created by Jacob Gambrell on 3/15/23.
////
//
//import Foundation
//import Firebase
//
//struct User: Identifiable, Codable {
//    var id: String
//    var firstname: String
//    var lastname: String
//    var email: String
//    var username: String
//    var password: String
//
//    init(id: String, firstname: String, lastname: String, email: String, username: String, password: String) {
//        self.id = id
//        self.firstname = firstname
//        self.lastname = lastname
//        self.email = email
//        self.username = username
//        self.password = password
//    }
//
//    func toDict() -> [String: Any] {
//        return [
//            "id": id,
//            "firstname": firstname,
//            "lastname": lastname,
//            "email": email,
//            "username": username,
//            "password": password
//        ]
//    }
//}
//
//class LoginModel {
//
//    static let db = Firestore.firestore()
//
//    static func validate(user: inout User, completion: @escaping (Bool, User?) -> Void) {
//        var mutableUser = user // make a mutable copy of user
//        let usersRef = db.collection("Users")
//
//        // Check for a document that matches the given username and password
//        usersRef.whereField("username", isEqualTo: user.username)
//            .whereField("password", isEqualTo: user.password)
//            .getDocuments { (snapshot, error) in
//
//                // If there was an error, return false and print the error message
//                if let error = error {
//                    print("Error getting documents: \(error.localizedDescription)")
//                    completion(false, nil)
//                    return
//                }
//
//                // If there was no error and there is at least one matching document, return true
//                if let snapshot = snapshot, !snapshot.isEmpty {
//                    let document = snapshot.documents[0]
//                    let firstname = document.get("firstname") as? String
//                    let lastname = document.get("lastname") as? String
//                    let email = document.get("email") as? String
//
//                    print("------HERE------")
//                    print(firstname)
//                    print(lastname)
//                    print(email)
//
////                    mutableUser.firstname = firstname
////                    mutableUser.lastname = lastname
////                    mutableUser.email = email
//
//                    completion(true, mutableUser)
//                    return
//                }
//
//                // If there was no error but no documents match, return false
//                completion(false, nil)
//            }
//        user = mutableUser // copy the updated mutable user back to the original parameter
//    }
//
//    static func createAccount(user: User, completion: @escaping (Bool) -> Void) {
//        guard !user.username.isEmpty else {
//            completion(false)
//            return
//        }
//
//        db.collection("Users").document(user.username).setData([
//            "firstname": user.firstname,
//            "lastname": user.lastname,
//            "username": user.username,
//            "password": user.password,
//            "email": user.email
//        ]) { err in
//            if let err = err {
//                print("Error adding document: \(err)")
//                completion(false)
//            } else {
//                print("Document added with ID")
//                completion(true)
//            }
//        }
//    }
//}
