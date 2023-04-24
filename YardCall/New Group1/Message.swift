//
//  Message.swift
//  YardCall
//
//  Created by Jacob Gambrell on 4/14/23.
//

import Foundation

struct Message: Identifiable, Codable {
    var id: String
    var text: String
    var received: Bool
    var timestamp: Date
}
