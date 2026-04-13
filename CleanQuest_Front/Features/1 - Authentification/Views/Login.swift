//
//  Login.swift
//  CleanQuest
//
//  Created by caroletm on 25/02/2026.
//

import SwiftUI

struct Login : View {
    
    @Environment(UserViewModel.self) var userVM
    @Environment(NavigationViewModel.self) var navVM
    @Environment(AuthViewModel.self) var authVM
    
    var body: some View {
        
        @Bindable var authVM = authVM
        @Bindable var userVM = userVM
        
            VStack {
                Spacer()
                Image(.maisonCleanQuest)
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
                    
                    TextfieldPassword(text: $userVM.password, isPasswordVisible: $authVM.isPasswordVisible, placeholder: "mot de passe")
                    
                    HStack{
                        Spacer()
                        
                        Button {
                            navVM.path.append(AppRoute.forgotPassword)
                        }label:{
                            Text("Mot de passe oublié ?")
                                .foregroundStyle(Color(.black))
                                .font(.custom("Parkinsans-Medium", size: 14))
                                .underline()
                        }
                    }
                    .padding()
                    
                    if let errorMessage = authVM.errorMessage {
                        Text(errorMessage)
                            .padding(10)
                            .font(.system(size: 14, weight: .medium))
                            .foregroundColor(.red)
                    }
                }
                .padding(.horizontal)
                
                Spacer()
                
                PrimaryButton(text: "Se connecter", width: 185, height: 50) {
                    Task { await authVM.signIn()}
                }
                
                SecondaryButton(text: "Pas de compte ?", width: 185, height: 50) {
                    withAnimation {
                        authVM.showSignIn = true
                        authVM.showLogin = false
                    }
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
        .environment(NavigationViewModel())
        .environment(AuthViewModel(userVM: userVM))
}
