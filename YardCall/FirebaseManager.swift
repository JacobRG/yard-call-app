////
////  FirebaseManager.swift
////  YardCall
////
////  Created by Jacob Gambrell on 3/18/23.
////
//
//import Foundation
//import Firebase
//
//class FirebaseManager {
//
//    static let shared = FirebaseManager()
//    private let db = Firestore.firestore()
//
//    func createUser(user: User, completion: @escaping (Error?) -> Void) {
//        db.collection("users").document(user.id).setData(user.toDict()) { error in
//            completion(error)
//        }
//    }
//
//    func getUser(userId: String, completion: @escaping (User?, Error?) -> Void) {
//        db.collection("users").document(userId).getDocument { (document, error) in
//            if let error = error {
//                completion(nil, error)
//                return
//            }
//            guard let document = document, document.exists else {
//                completion(nil, nil)
//                return
//            }
//            let data = document.data()!
//            let user = User(id: document.documentID, firstname: data["firstname"] as! String, lastname: data["lastname"] as! String, email: data["email"] as! String, username: data["username"] as! String, password: data["password"] as! String)
//            completion(user, nil)
//        }
//    }
//
//}
