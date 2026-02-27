//
//  Login.swift
//  CleanQuest
//
//  Created by caroletm on 25/02/2026.
//

import SwiftUI

struct SignIn : View {
    
    @Environment(UserViewModel.self) var userVM
    
    var body: some View {
        
        @Bindable var userVM = userVM
        
        VStack {
            Image(.mainHouse)
                .resizable()
                .scaledToFit()
                .frame(width: 82, height: 82)
            Text("CleanQuest")
                .font(.custom("Parkinsans-Bold", size: 24))
            Text("La bataille du propre")
                .font(.custom("Parkinsans-Regular", size: 14))
            
            Spacer()
            
            VStack (alignment : .leading, spacing: 15) {
                
                Text("Nom")
                    .font(.custom("Parkinsans-SemiBold", size: 16))
                
                Textfield(text: $userVM.nom, placeholder: "nom")
                
                Text("Email")
                    .font(.custom("Parkinsans-SemiBold", size: 16))
                
                Textfield(text: $userVM.email, placeholder: "email")
                
                Text("Mot de passe")
                    .font(.custom("Parkinsans-SemiBold", size: 16))
                
                SecurefieldPassword(text: $userVM.password, isPasswordVisible: $userVM.isPasswordVisible)
                
                Text("Confirmer le mot de passe")
                    .font(.custom("Parkinsans-SemiBold", size: 16))
                
                SecurefieldPassword(text: $userVM.passwordConfirm, isPasswordVisible: $userVM.isPasswordConfirmVisible)
                
                HStack{
                    Spacer()
                    Button {
                        //
                    }label:{
                        Text("Mot de passe oublié ?")
                            .foregroundStyle(Color(.black))
                            .font(.custom("Parkinsans-Medium", size: 14))
                            .underline()
                    }
                }
                .padding()
            }
            .padding(.horizontal)
            
            
            
            PrimaryButton(text: "Se connecter", width: 185, height: 50) {
                //
            }
            
            SecondaryButton(text: "Pas de compte ?", width: 185, height: 50) {
                //
            }
            
            Spacer()
        }
        .padding(.horizontal,20)
        .padding(.vertical,40)
    }
}

#Preview {
    let userVM = UserViewModel()
    SignIn()
        .environment(userVM)

}
