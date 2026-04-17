//
//  ModalSelectMemberColors.swift
//  CleanQuest_Front
//
//  Created by caroletm on 15/04/2026.
//

import SwiftUI

struct ModalSelectMemberColors: View {
    
    @Environment(FoyerViewModel.self) var foyerVM: FoyerViewModel
    @Binding var currentStep : Int
    
    var body: some View {
        
        
        
        VStack (spacing : 20) {
            HStack {
                Text("Son avatar")
                    .font(.custom("Parkinsans-SemiBold", size: 16))
                Spacer()
            }
            LazyVGrid(
                columns: Array(repeating: GridItem(.flexible(), spacing: 4), count: 5),
                spacing: 10
            ) {
                ForEach(foyerVM.avatarImages, id: \.self) { avatar in
                    Button {
                        foyerVM.selectedAvatarMembre = avatar
                    } label: {
                        Image(avatar)
                            .resizable()
                            .scaledToFit()
                            .opacity(foyerVM.selectedAvatarMembre == avatar ? 1 : 0.5)
                    }
                }
            }
            .padding(.horizontal)
            
            HStack {
                Text("Sa couleur")
                    .font(.custom("Parkinsans-SemiBold", size: 16))
                Spacer()
            }
            
            ScrollView(.horizontal) {
                HStack {
                    ForEach(foyerVM.colorsTheme, id: \.self) { couleur in
                        Button {
                            foyerVM.selectedCouleurMembre = couleur
                        } label: {
                            Circle()
                                .fill(couleur)
                                .frame(width: 47, height: 47)
                                .overlay(
                                    Circle()
                                        .stroke( .black, lineWidth: foyerVM.selectedCouleurMembre == couleur ? 2 : 0.5)
                                )
                        }
                    }
                }
                .padding(.vertical, 10)
            }
            PrimaryButton(text: "Valider", width: 150, height: 50) {
                currentStep -= 1
            }
        }
    }
}

#Preview {
    ModalSelectMemberColors(currentStep: .constant(1))
        .environment(FoyerViewModel())
}
