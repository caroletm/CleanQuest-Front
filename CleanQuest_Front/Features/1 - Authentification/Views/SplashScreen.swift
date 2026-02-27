//
//  SplashScreen.swift
//  CleanQuest
//
//  Created by caroletm on 24/02/2026.
//

import SwiftUI

struct SplashScreen: View {
    
    @State var isOnboardingPresented: Bool = false
    @State private var onboardingIndex = 0
    
    var body: some View {
        
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
                onboardingIndex = 0
                isOnboardingPresented = true
            }
            Spacer()
        }
        .sheet(isPresented: $isOnboardingPresented) {
            OnboardingModal(currentIndex: $onboardingIndex)
            .presentationDetents([.medium])
        }
    }
}

#Preview {
    SplashScreen()
}
