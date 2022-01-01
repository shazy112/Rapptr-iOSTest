//
//  Message.swift
//  Rapptr iOS Test
//
//  Created by Ethan Humphrey on 8/11/21.
//

import Foundation

// MARK: - Chat
struct Chat: Codable {
    let message: [Message]
    
    enum CodingKeys: String, CodingKey {
        case message = "data"
    }
}

// MARK: - Datum
struct Message: Codable {
    let userID, name: String
    let avatarURL: String
    let message: String
    
    enum CodingKeys: String, CodingKey {
        case userID = "user_id"
        case name
        case avatarURL = "avatar_url"
        case message
    }
}
