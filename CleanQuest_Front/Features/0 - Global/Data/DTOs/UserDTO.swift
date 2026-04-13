//
//  UserDTO.swift
//  CleanQuest_Front
//
//  Created by caroletm on 13/04/2026.
//

import Foundation


//login
struct LoginRequest : Codable {
    let email: String
    let password: String
}

// Réponse du login (token)
struct LoginResponse: Codable {
    let token: String
}

//reponse user
struct UserDTO: Codable {
    var id: UUID?
    var name: String
    var email: String
    var telephone: String
}

//signup
struct UserCreateDTO: Codable {
    var name: String
    var email: String
    var password: String
    var telephone: String
}
