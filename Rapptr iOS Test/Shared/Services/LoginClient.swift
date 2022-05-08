//
//  LoginService.swift
//  Rapptr iOS Test
//
//  Created by Rutkoski,Augustus on 5/8/22.
//

import Foundation


/**
 * =========================================================================================
 * INSTRUCTIONS
 * =========================================================================================
 * 1) Make a request here to login.
 *
 * 2) Using the following endpoint, make a request to login
 *    URL: http://dev.rapptrlabs.com/Tests/scripts/login.php
 *
 * 3) Don't forget, the endpoint takes two parameters 'email' and 'password'
 *
 * 4) email - info@rapptrlabs.com
 *   password - Test123
 *
*/

class LoginClient {
    
    static let shareInstance = LoginClient()
    
    private init() { }
    
    func login(email: String, password: String) async throws -> LoginResponse {
        
        //request details
        var request = try URLRequest(url: URL(string: "http://dev.rapptrlabs.com/Tests/scripts/login.php")!, method: .post)
        request.httpBody = "email=\(email)&password=\(password)".data(using: .utf8)
        
        //request
        let (data, response) = try await URLSession.shared.data(for: request)
        
        //response handling
        let loginResponse = try JSONDecoder().decode(LoginResponse.self, from: data)
        
        if let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 {
            return loginResponse
        } else {
            throw NetworkError.loginError(loginResponse)
        }
    }
}
