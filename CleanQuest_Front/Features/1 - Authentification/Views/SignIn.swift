//
//  Login.swift
//  CleanQuest
//
//  Created by caroletm on 25/02/2026.
//

import SwiftUI

struct SignIn : View {
    
    @Environment(UserViewModel.self) var userVM
    @Environment(AuthViewModel.self) var authVM
    @Environment(NavigationViewModel.self) var navVM
    
    var body: some View {
        
        @Bindable var userVM = userVM
        @Bindable var authVM = authVM
        
        
        ScrollView{
            VStack {
                Image(.maisonCleanQuest)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 82, height: 82)
                Text("CleanQuest")
                    .font(.custom("Parkinsans-Bold", size: 24))
                Text("La bataille du propre")
                    .font(.custom("Parkinsans-Regular", size: 14))
                    .padding(.bottom, 30)
                
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
                    
                    TextfieldPassword(text: $userVM.password, isPasswordVisible: $authVM.isPasswordVisible, placeholder: "mot de passe")
                    
                    Text("Confirmer le mot de passe")
                        .font(.custom("Parkinsans-SemiBold", size: 16))
                    
                    TextfieldPassword(text: $userVM.passwordConfirm, isPasswordVisible : $authVM.isPasswordConfirmVisible, placeholder: "mot de passe")
                    
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
                }
                .padding(.horizontal)
                
                PrimaryButton(text: "Se connecter", width: 185, height: 50) {
                    Task { await authVM.signUp()}
                }
                
                SecondaryButton(text: "Déjà un compte ?", width: 185, height: 50) {
                    withAnimation {
                        authVM.showSignIn = false
                        authVM.showLogin = true
                    }
                }
                
                Spacer()
            }
            .padding(.horizontal,20)
            .padding(.vertical,40)
        }
    }
}

#Preview {
    let userVM = UserViewModel()
    SignIn()
        .environment(userVM)
        .environment(AuthViewModel(userVM: userVM))
        .environment(NavigationViewModel())
    
}
