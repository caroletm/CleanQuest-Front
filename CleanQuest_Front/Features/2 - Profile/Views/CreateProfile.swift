//
// CreateProfile.swift
//  CleanQuest
//
//  Created by caroletm on 26/02/2026.
//

import SwiftUI

struct CreateProfile: View {
    
    @Environment(UserViewModel.self) var userVM
    @Environment(NavigationViewModel.self) var navVM
    @Environment(FoyerViewModel.self) var foyerVM

    var body: some View {
        
        @Bindable var userVM = userVM
        
        VStack {
            
            HeaderSimple(text: "Nouveau membre")
            
            .padding()
            
            Carrousel(
                pseudo: $userVM.pseudo,
                selectedColor: $userVM.selectedColor,
                selectedAvatar: $userVM.selectedAvatar,
                currentStep: $userVM.currentStep)
                .padding(20)
            
            Spacer()

            PrimaryButton(text: "Suivant", width: 125, height: 50) {
                
                if userVM.currentStep == CreateProfileStep.allCases.last {
                    
                    if userVM.isCreateProfileValid() {
                        
                        foyerVM.addNewMember(nom: userVM.pseudo, couleur: userVM.selectedColor , avatar: userVM.selectedAvatar, niveau: Niveau(rawValue: Niveau.debutant.rawValue) ?? .debutant, isGere: true, email: userVM.email)
                        
                        navVM.path.removeLast()
                    }
                
                }else {
                    userVM.nextStep()
                }
            }
            SecondaryButton(text: "Retour", width: 125, height: 50) {
                
                if let currentIndex = CreateProfileStep.allCases.firstIndex(of: userVM.currentStep), currentIndex > 0 {
                    userVM.previousStep()
                } else {
                    navVM.path.removeLast()
                }
            }
        }
        .alert("Champs manquants", isPresented: $userVM.showErrorAlert) {
            Button("OK", role: .cancel) { }
        } message: {
            Text(userVM.alertMessage)
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    let userVM = UserViewModel()
    CreateProfile()
        .environment(userVM)
        .environment(NavigationViewModel())
        .environment(FoyerViewModel())
       
}
