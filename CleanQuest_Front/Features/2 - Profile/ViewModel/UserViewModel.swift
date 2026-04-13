//  UserViewModel.swift
//  CleanQuest
//
//  Created by caroletm on 27/02/2026.
//
//


import SwiftUI
import Foundation
import Observation

@Observable

class UserViewModel {
    
    //MARK: - DataUser
    
    var nom : String = ""
    var email: String = ""
    var password: String = ""
    var passwordConfirm : String = ""

    
    var currentStep: CreateProfileStep = .name
    var selectedColor : Color = .lightGrey100
    var pseudo: String = ""
    var selectedAvatar: ImageResource = .avatar1
    
}
