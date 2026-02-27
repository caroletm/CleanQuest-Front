//
//  AuthViewModel.swift
//  CleanQuest
//
//  Created by caroletm on 26/02/2026.
//

import SwiftUI
import Foundation
import Observation

@Observable

class AuthViewModel{
    
    var userVM : UserViewModel
    
    init(userVM : UserViewModel) {
        self.userVM = userVM
    }
    
    //MARK: - Etats d'affichage
    
    var showSplash : Bool = true
    var showLogin : Bool = true
    var showSignIn : Bool = true
    
    var showOnboarding : Bool = false
    var onboardingIndex = 0
    
    //MARK: - Etats d'authentification
    
    var isAuthenticated : Bool = false
    var emailForgottenPassword : String = ""
        
}
