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

    var body: some View {
        
        @Bindable var userVM = userVM
        
        VStack {
            
            HStack {
                Text("Nouveau profil")
                    .font(.custom("Parkinsans-Bold", size: 28))
                Spacer()
                SmallCircleButton(imageSystemName: "gear") {
                    navVM.path.append(AppRoute.settings)
                }
            }
            .padding()
            
            Carrousel(
                pseudo: $userVM.pseudo,
                selectedColor: $userVM.selectedColor,
                selectedAvatar: $userVM.selectedAvatar,
                currentStep: $userVM.currentStep)
                .padding(20)
            
            Spacer()

            PrimaryButton(text: "Suivant", width: 125, height: 50) {
                userVM.nextStep()
            }
            SecondaryButton(text: "Retour", width: 125, height: 50) {
                userVM.previousStep()
            }
        }
    }
}

#Preview {
    let userVM = UserViewModel()
    CreateProfile()
        .environment(userVM)
        .environment(NavigationViewModel())
       
}
