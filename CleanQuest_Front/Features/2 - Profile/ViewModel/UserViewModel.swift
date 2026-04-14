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
    var selectedColor : Color? = nil
    var pseudo: String = ""
    var selectedAvatar: ImageResource? = nil
    
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
    
    //MARK: - Set name and
    
    
    
}
