//
//  ForgottenPasswordScreen.swift
//  CleanQuest_Front
//
//  Created by caroletm on 27/02/2026.
//

import SwiftUI

struct ForgottenPasswordScreen: View {
    
    @Environment(AuthViewModel.self) var authVM
    @Environment(NavigationViewModel.self) var navVM
    
    var body: some View {
        
        @Bindable var authVM = authVM
        
        
        VStack {
            HStack {
                Text("Mot de passe oublié ?")
                    .font(.custom("Parkinsans-Bold", size: 28))
                Spacer()
                
            }.padding()
            
            Spacer()
            
            VStack (alignment: .leading){
                Text("Saisissez votre email : ")
                    .font(.custom("Parkinsans-SemiBold", size: 16))
                Textfield(text: $authVM.emailForgottenPassword, placeholder: "email")
            }
            .padding(30)
            
            Text("Nous allons vous envoyer un code de réinitialisation de mot de passe sur votre adresse e-mail.")
                .font(.custom("Parkinsans-Regular", size: 16))
                .foregroundColor(.secondary)
                .multilineTextAlignment(.center)
                .padding()
            Spacer()
            
            VStack {
                PrimaryButton(text: "Envoyer", width: 185, height: 50) {}
                SecondaryButton(text: "Retour", width: 185, height: 50) {
                    navVM.path.removeLast()
                }
            }
        }
    }
}

#Preview {
    let uservm = UserViewModel()
    ForgottenPasswordScreen()
        .environment(AuthViewModel(userVM: uservm))
        .environment(NavigationViewModel())
}
