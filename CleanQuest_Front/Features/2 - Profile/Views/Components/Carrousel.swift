//
//  Carrousel.swift
//  CleanQuest
//
//  Created by caroletm on 26/02/2026.
//

import SwiftUI

struct Carrousel : View {
    
    @Binding var pseudo : String
    @Binding var selectedColor : Color?
    @Binding var selectedAvatar : ImageResource?
    @Binding var currentStep : CreateProfileStep
    
    @ViewBuilder
    func stepView( for step: CreateProfileStep) -> some View {
        switch step {
        case .name:
            NameStep(pseudo: $pseudo)
        case .color:
            ColorStep(selectedColor: $selectedColor, name: $pseudo)
        case .avatar:
            AvatarStep(selectedColor: $selectedColor, name: $pseudo, selectedAvatar: $selectedAvatar)
        }
    }
    
    var body: some View {
        GeometryReader { geo in
            VStack {
                TabView(selection: $currentStep) {
                    ForEach(CreateProfileStep.allCases, id: \.self) { step in
                        stepView(for: step)
                            .tag(step)
                    }
                }
                .tabViewStyle(.page(indexDisplayMode: .never))
                .frame(height: geo.size.height * 0.92)

                HStack {
                    ForEach(CreateProfileStep.allCases, id: \.self) { step in
                        Circle()
                            .fill(step == currentStep ? Color.black : Color.lightGrey100)
                            .frame(width: 8, height: 8)
                    }
                }
            }
        }
    }
}

#Preview {
    Carrousel(pseudo: .constant(""), selectedColor: .constant(.lightGreen100),  selectedAvatar: .constant(.avatar1), currentStep: .constant(.name))
}
