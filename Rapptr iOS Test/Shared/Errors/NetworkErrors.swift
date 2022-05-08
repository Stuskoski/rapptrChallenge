//
//  NetworkErrors.swift
//  Rapptr iOS Test
//
//  Created by Rutkoski,Augustus on 5/8/22.
//

import Foundation

enum NetworkError: Error {
    case loginError(LoginResponse)
}
