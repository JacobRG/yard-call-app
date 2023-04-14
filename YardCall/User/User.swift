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
}
