//
//  ChatClient.swift
//  Rapptr iOS Test
//
//  Created by Ethan Humphrey on 8/11/21.
//

import Foundation

/**
 * =========================================================================================
 * INSTRUCTIONS
 * =========================================================================================
 * 1) Make a request to fetch chat data used in this app.
 *
 * 2) Using the following endpoint, make a request to fetch data
 *    URL: http://dev.rapptrlabs.com/Tests/scripts/chat_log.php
 *
 */

class ChatClient {
    
    static let shareInstance = ChatClient()
    
    private init() { }
    
    var session: URLSession?
    
    func fetchChatData() async throws -> MessageResponse {
        
        //request details
        let request = try URLRequest(url: URL(string: "http://dev.rapptrlabs.com/Tests/scripts/chat_log.php")!, method: .get)
        
        //request
        let (data, response) = try await URLSession.shared.data(for: request)
        
        //response handling
        let chatResponse = try JSONDecoder().decode(MessageResponse.self, from: data)
        
        if let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 {
            return chatResponse
        } else {
            throw NetworkError.chatError("Response code was not 200")
        }
    }
}
