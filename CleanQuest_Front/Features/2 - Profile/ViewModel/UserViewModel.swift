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
    
    var alertMessage: String = ""
    var showErrorAlert: Bool = false
    
    //MARK: - DataUser
    
    var nom : String = ""
    var email: String = ""
    var password: String = ""
    var passwordConfirm : String = ""

    
    var currentStep: CreateProfileStep = .name
    var selectedColor : Color? = nil
    var pseudo: String = ""
    var selectedAvatar: String? = nil
    
    //MARK: - Onboarding
    
    func nextStep() {
        let step = CreateProfileStep.allCases
        
        if let i = step.firstIndex(of: currentStep),
           i < step.count - 1 {
            currentStep = step[i + 1]
        }
    }
    
    func previousStep() {
        let step = CreateProfileStep.allCases
        
        if let i = step.firstIndex(of: currentStep),
           i > 0 {
            currentStep = step[i - 1]
        }
    }

    //MARK: - Creation du profil membre en tant que user
    
    func isCreateProfileValid() -> Bool {
        guard !pseudo.isEmpty else {
            alertMessage = "Le pseudo est obligatoire."
            showErrorAlert = true
            return false
        }
        guard selectedAvatar != nil else {
            alertMessage = "Veuillez choisir un avatar."
            showErrorAlert = true
            return false
        }
        guard selectedColor != nil else {
            alertMessage = "Veuillez choisir une couleur."
            showErrorAlert = true
            return false
        }
        return true
    }
    
    
}
