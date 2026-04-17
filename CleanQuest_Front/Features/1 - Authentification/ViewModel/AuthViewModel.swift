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
        self.authToken = UserDefaults.standard.string(forKey: tokenKey)
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
    var firstConnection: Bool = true
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
            print("token : \(authToken ?? "")")
            UserDefaults.standard.set(token, forKey: tokenKey)
            
            // Charger le profil utilisateur
            currentUser = try await userService.getProfile(token: token)
            print("Profil chargé: \(String(describing: currentUser?.name))")
            if currentUser?.name != nil {
                userVM.nom = currentUser!.name
            }
            
            // Vérifier première connexion
            checkFirstConnection()
            showLogin = false
            showSignIn = false
            
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
    
    // MARK: - Inscription utilisateur
    // Crée un nouveau compte utilisateur avec validation des champs.
    // Redirige vers l'écran de connexion en cas de succès.
    
    func signUp() async {
        guard !userVM.email.isEmpty, !userVM.password.isEmpty, !userVM.nom.isEmpty else {
            errorMessage = "Tous les champs doivent être remplis"
            return
        }
        guard userVM.email.contains("@") && userVM.email.contains(".") else {
            errorMessage = "Email invalide"
            return
        }
        guard userVM.password.count >= 8 else {
            errorMessage = "Le mot de passe doit contenir au moins 8 caractères"
            return
        }
        
        guard userVM.password == userVM.passwordConfirm, !userVM.passwordConfirm.isEmpty else {
            errorMessage = "Les mots de passe ne sont pas identiques"
            return
        }
        
        isLoading = true
        defer { isLoading = false }
        errorMessage = nil
        
        do {
            // Création du user
            
            let user = try await userService.signUp(
                name: userVM.nom,
                email: userVM.email,
                password: userVM.password
            )
            
            print("Inscription réussie pour: \(user.name)")
            
            // Login automatique
            let token = try await userService.login(email: userVM.email, motDePasse: userVM.password)
            authToken = token
            UserDefaults.standard.set(token, forKey: tokenKey)
            
            // Charger le profil
            await loadUserProfile()
            
            // Vérifier première connexion
            checkFirstConnection()
            showLogin = false
            showSignIn = false
            
            // Réinitialiser le mot de passe
            userVM.password = ""
            userVM.passwordConfirm = ""
            errorMessage = nil
            
        } catch {
            errorMessage = "Erreur lors de l'inscription. Email peut-être déjà utilisé."
            print("Erreur d'inscription: \(error)")
        }
    }
    
    // MARK: - Chargement du profil utilisateur
    /// Charge le profil utilisateur à partir du token JWT stocké.
    /// Si le token est invalide ou expiré, l'utilisateur est déconnecté.
    
    @MainActor
    func loadUserProfile() async {
        guard let token = authToken else {
            isAuthenticated = false
            return
        }
        isLoading = true
        
        do {
            currentUser = try await userService.getProfile(token: token)
            isAuthenticated = true
            //            showLogin = false
            //            showSignUp = false
            print("Profil chargé: \(currentUser?.name ?? "Unknown")")
            if let email = currentUser?.email {
                userVM.email = email
            }
            
        } catch {
            // Token invalide ou expiré
            print("Token invalide ou expiré")
            logout()
        }
        
        isLoading = false
    }
    
    // MARK: - Déconnexion utilisateur
    /// Supprime le token et réinitialise l’état d’authentification.
    @MainActor
    func logout() {
        // Clear le token
        authToken = nil
        currentUser = nil
        isAuthenticated = false
        UserDefaults.standard.removeObject(forKey: tokenKey)
        
        // Réinitialise les champs
        userVM.email = ""
        userVM.password = ""
        userVM.passwordConfirm = ""
        userVM.nom = ""
        errorMessage = nil
        
        // Retour à la landing page
        showLogin = true
        //        showSignUp = false
        
        print(" Déconnexion réussie")
    }
    
    // MARK: - Suppression Compte utilisateur
    
    @MainActor
    func deleteAccount() async {
        guard let userId = currentUser!.id else { return }
        do {
            try await userService.deleteAccount(id: userId)
            logout()
        } catch {
            print("Erreur lors de la suppression du compte")
        }
    }
    
    // MARK: - Réinitialisation des erreurs
    /// Supprime le message d’erreur affiché.
    func clearError() {
        errorMessage = nil
    }
    
    // MARK: - Gestion de l'onboarding
    
    //    //Checker si c'est la 1ere connexion
    func checkFirstConnection() {
        guard let user = currentUser else { return }
        firstConnection = user.firstConnection
        showOnboarding = user.firstConnection
    }
    
    // MARK: - Persistence des données
    
    func checkAutoLogin() async {
        guard authToken != nil else {
            showSplash = false
            return
        }
        await loadUserProfile()
        showSplash = false
    }
    
}
