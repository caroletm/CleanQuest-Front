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
    
    var isPasswordVisible : Bool = false
    var isPasswordConfirmVisible : Bool = false
    
    //MARK: - Etats d'authentification
    
    var isAuthenticated : Bool = false
    var emailForgottenPassword : String = ""
    var firstConnection: Bool = false
    var currentUser : UserDTO?
    var authToken: String?
    var errorMessage: String?
    var isLoading: Bool = false
    
    // MARK: - Services et stockage
    private let userService = UserService.shared
    private let tokenKey = "token"
    
    //MARK: - Login Page
    
    //se connecter
    func signIn() async {
        guard !userVM.email.isEmpty, !userVM.password.isEmpty else {
            errorMessage = "Email ou mot de passe vide"
            return
        }
        
        isLoading = true
        defer { isLoading = false }
        
        errorMessage = nil
        
        do {
            // Login et récupération du token
            let token = try await userService.login(email: userVM.email, motDePasse: userVM.password)
            authToken = token
            UserDefaults.standard.set(token, forKey: tokenKey)
            
            // Charger le profil utilisateur
            currentUser = try await userService.getProfile(token: token)
            print("Profil chargé: \(String(describing: currentUser?.name))")
            if currentUser?.name != nil {
                userVM.nom = currentUser!.name
            }

            // Vérifier première connexion
//            checkFirstConnection()
//            userVM.update(from: currentUser!)

            showLogin = false
//            showSignUp = false
            
            // Réinitialiser le mot de passe local
            userVM.password = ""
            userVM.passwordConfirm = ""
            isAuthenticated = true
            
        } catch URLError.userAuthenticationRequired {
            errorMessage = "Email ou mot de passe incorrect"
            print("Auth échouée")
        } catch {
            errorMessage = "Erreur de connexion. Vérifiez votre connexion."
            print("Erreur: \(error)")
        }
 
    }
        
}
