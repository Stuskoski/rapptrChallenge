//
//  Message.swift
//  Rapptr iOS Test
//
//  Created by Ethan Humphrey on 8/11/21.
//

import Foundation

struct MessageResponse: Codable {
    var messages: [Message]
    
    private enum CodingKeys: String, CodingKey {
        case messages = "data"
    }
}

struct Message: Codable {
    var userID: String
    var username: String
    var avatarURL: URL?
    var text: String
    
    init(testName: String, withTestMessage message: String) {
        self.userID = "0"
        self.username = testName
        self.avatarURL = URL(string: "https://upload.wikimedia.org/wikipedia/commons/thumb/8/85/Smiley.svg/220px-Smiley.svg.png")
        self.text = message
    }
    
    private enum CodingKeys: String, CodingKey {
        case userID = "user_id"
        case username = "name"
        case avatarURL = "avatar_url"
        case text = "message"
    }
}

// MARK: - Test Data
extension Message {
    static func testData() -> [Message] {
        var messages = [Message]()
        
        messages.append(Message(testName: "James", withTestMessage: "Hey Guys!"))
        messages.append(Message(testName:"Paul", withTestMessage:"What's up?"))
        messages.append(Message(testName:"Amy", withTestMessage:"Hey! :)"))
        messages.append(Message(testName:"James", withTestMessage:"Want to grab some food later?"))
        messages.append(Message(testName:"Paul", withTestMessage:"Sure, time and place?"))
        messages.append(Message(testName:"Amy", withTestMessage:"YAS! I am starving!!!"))
        messages.append(Message(testName:"James", withTestMessage:"1 hr at the Local Burger sound good?"))
        messages.append(Message(testName:"Paul", withTestMessage:"Sure thing.  But first I must type a long message so I can see multiple lines on the cell."))
        messages.append(Message(testName:"Amy", withTestMessage:"See you there :P"))
        
        return messages
    }
}
