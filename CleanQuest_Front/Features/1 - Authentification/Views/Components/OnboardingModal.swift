//
//  OnboardingView.swift
//  CleanQuest
//
//  Created by caroletm on 24/02/2026.
//

import SwiftUI

struct OnboardingModal: View {
    
    @Binding var currentIndex: Int
    @Environment(\.dismiss) private var dismiss
    
    private var onboardingStep: OnboardingModel { onboardingSteps[currentIndex] }
    
    var body: some View {
        
        ZStack {
            onboardingStep.backgroundColor
                .ignoresSafeArea(edges: .all)
            
            VStack (spacing : 40) {
                HStack(spacing: 8) {
                    ForEach(onboardingSteps.indices, id: \.self) { index in
                        Capsule()
                            .frame(width: 60, height: 4)
                            .foregroundStyle(index <= currentIndex ? Color.black :onboardingStep.capsuleColor)
                    }
                }
                
                HStack {
                    if currentIndex != 0 {
                        Button {
                            if currentIndex < onboardingSteps.count - 1 {
                                currentIndex -= 1
                            }else{
                                currentIndex -= 1
                                //navigation vers l'authentification
                            }
                        }label :{
                            Image(systemName: "arrow.left.circle")
                                .font(.system(size: 24))
                                .foregroundStyle(Color.black)
                        }
                    }
             
                    Text(onboardingStep.title)
                        .font(.custom("Parkinsans-SemiBold", size: 24))
                }
                
                Image(onboardingStep.image)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 71, height: 71)
                
                Text(onboardingStep.subtitle)
                    .font(.custom("Parkinsans-Medium", size: 16))
                
                PrimaryButton(
                    text: currentIndex == onboardingSteps.count - 1 ? "Commencer" : "Suivant",
                    width: 125,
                    height: 50
                ) {
                    if currentIndex < onboardingSteps.count - 1 {
                        currentIndex += 1
                    } else {
                        dismiss()
                    }
                }
                
            }
        }
    }
}

#Preview {
    OnboardingModal(currentIndex: .constant(0))
}
