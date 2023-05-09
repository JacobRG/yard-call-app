//
//  ConvoManager.swift
//  YardCall
//
//  Created by Jacob Gambrell on 4/25/23.
//

import Foundation
import Firebase
import FirebaseFirestore
import FirebaseFirestoreSwift

class ConvoManager: ObservableObject {
    @Published private(set) var conversations: [Conversation] = []
    @Published private(set) var lastConvoId: String = ""
    let user = UserViewModel()
    
    // Create an instance of our Firestore database
    let db = Firestore.firestore()
    
    // On initialize of the ConvoManager class, get the conversations from Firestore
    init() {
        getConvos()
    }
    
    // Read message from Firestore in real-time with the addSnapShotListener
    func getConvos() {
        db.collection("Users").document(UserViewModel().user!.id).collection("Conversations").addSnapshotListener { querySnapshot, error in
            
            // If we don't have documents, exit the function
            guard let documents = querySnapshot?.documents else {
                print("Error fetching documents: \(String(describing: error))")
                return
            }
            
            // Mapping through the documents
            self.conversations = documents.compactMap { document -> Conversation? in
                do {
                    // Converting each document into the Message model
                    // Note that data(as:) is a function available only in FirebaseFirestoreSwift package - remember to import it at the top
                    return try document.data(as: Conversation.self)
                } catch {
                    // If we run into an error, print the error in the console
                    print("Error decoding document into Conversation: \(error)")
                    
                    // Return nil if we run into an error - but the compactMap will not include it in the final array
                    return nil
                }
            }
            
            // Sorting the conversations by sent date
            self.conversations.sort { $0.timestamp < $1.timestamp }
            
            // Getting the ID of the last conversation so we automatically scroll to it in ContentView
            if let id = self.conversations.last?.id {
                self.lastConvoId = id
            }
        }
    }
    
    
}
