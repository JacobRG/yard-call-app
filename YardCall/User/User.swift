//
//  User.swift
//  YardCall
//
//  Created by Jacob Gambrell on 4/7/23.
//

import Foundation

struct User: Codable {
    var id: String
    var firstname: String
    var lastname: String
    var email: String
    var username: String
    var password: String
    var role: String
    var signUpDate = Date.now
    var conversations: [Conversation]
    var address: Address?
}

struct Conversation: Identifiable, Codable {
    var id: String
    var user1: String
    var user2: String
    var timestamp: Date
}

struct Message: Identifiable, Codable {
    var id: String
    var text: String
    var received: Bool
    var timestamp: Date
}

struct Address: Identifiable, Codable {
    var id: String
    var unitnumber: String
    var streetnumber: String
    var address: String
    var city: String
    var region: String
    var postalcode: String
}
