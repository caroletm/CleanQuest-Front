//
// CreateProfile.swift
//  CleanQuest
//
//  Created by caroletm on 26/02/2026.
//

import SwiftUI

struct CreateProfile: View {
    
    @Environment(UserViewModel.self) var userVM

    var body: some View {
        
        @Bindable var userVM = userVM
        
        VStack {
            
            HStack {
                Text("Nouveau profil")
                    .font(.custom("Parkinsans-Bold", size: 28))
                Spacer()
                SmallCircleButton(imageSystemName: "gear") {}
            }
            .padding()
            
            Carrousel(pseudo: $userVM.pseudo, selectedColor: $userVM.selectedColor, currentStep: $userVM.currentStep, selectedAvatar: $userVM.selectedAvatar)
                .padding(20)
            
            Spacer()

            PrimaryButton(text: "Suivant", width: 185, height: 50) {
                //
            }
            SecondaryButton(text: "Retour", width: 185, height: 50) {
                //
            }
        }
    }
}

#Preview {
    let userVM = UserViewModel()
    CreateProfile()
        .environment(userVM)
}
