//
//  SplashScreen.swift
//  CleanQuest
//
//  Created by caroletm on 24/02/2026.
//

import SwiftUI

struct SplashScreen: View {
    
    @Environment(AuthViewModel.self) var authVM
    
    var body: some View {
        
        @Bindable var authVM = authVM
        
        
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
            PrimaryButton(text: "Commencer", width: 185, height: 50) {
                authVM.onboardingIndex = 0
                authVM.showOnboarding = true
            }
            Spacer()
        }
        .sheet(isPresented: $authVM.showOnboarding) {
            OnboardingModal(currentIndex: $authVM.onboardingIndex)
                .presentationDetents([.medium])
        }
    }
}

#Preview {
    let userVM = UserViewModel()
    SplashScreen()
        .environment(AuthViewModel(userVM: userVM))
}
