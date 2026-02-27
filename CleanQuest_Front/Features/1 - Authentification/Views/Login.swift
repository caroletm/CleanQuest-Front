//
//  Login.swift
//  CleanQuest
//
//  Created by caroletm on 25/02/2026.
//

import SwiftUI

struct Login : View {
    
    @Environment(UserViewModel.self) var userVM
    
    var body: some View {
        
        @Bindable var userVM = userVM
        
        VStack {
            Spacer()
            Image(.mainHouse)
                .resizable()
                .scaledToFit()
                .frame(width: 82, height: 82)
            Text("CleanQuest")
                .font(.custom("Parkinsans-Bold", size: 24))
            Text("La bataille du propre")
                .font(.custom("Parkinsans-Regular", size: 14))
            
            Spacer()
            
            VStack (alignment : .leading) {
                Text("Email")
                    .font(.custom("Parkinsans-SemiBold", size: 16))
                
                Textfield(text: $userVM.email, placeholder: "email")
                
                Text("Mot de passe")
                    .font(.custom("Parkinsans-SemiBold", size: 16))
                
                SecurefieldPassword(text: $userVM.password, isPasswordVisible: $userVM.isPasswordVisible)
                
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
            
            
            Spacer()
            
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
    Login()
        .environment(userVM)
}
