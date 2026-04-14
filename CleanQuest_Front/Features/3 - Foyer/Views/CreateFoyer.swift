//
//  CreateFoyer.swift
//  CleanQuest_Front
//
//  Created by caroletm on 14/04/2026.
//

import SwiftUI

struct CreateFoyer: View {
    
    @Environment(NavigationViewModel.self) var navVM
    @Environment(FoyerViewModel.self) var foyerVM
    
    
    var body: some View {
        
        @Bindable var foyerVM = foyerVM
        
        
        ScrollView {
            
            VStack {
                
                HeaderToolbar(text: "Nouveau foyer") {
                    navVM.path.append(AppRoute.settings)
                }
                
                Image(.family)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 71)
                
                Text("Nom du foyer")
                    .font(.custom("Parkinsans-SemiBold", size: 20))
                
                Textfield(text: $foyerVM.nomFoyer, placeholder: "nom du foyer")
                    .padding(.horizontal, 20)
                    .padding(10)
                
                VStack (spacing : 20) {
        
                    //TYPE DE FOYER
                    VStack(alignment: .leading) {
                        Text("Type de foyer")
                            .font(.custom("Parkinsans-SemiBold", size: 20))
                        
                        let types = FoyerType.allCases
                        let half = (types.count + 1) / 2
                        
                        VStack(alignment: .leading, spacing: 12) {
                            HStack(spacing: 8) {
                                ForEach(Array(types.prefix(half)), id: \.self) { type in
                                    SmallOptionButton(text: type.title, isSelected: foyerVM.selectedType == type) {
                                        foyerVM.selectedType = type
                                    }
                                }
                            }
                            HStack(spacing: 8) {
                                ForEach(Array(types.dropFirst(half)), id: \.self) { type in
                                    SmallOptionButton(text: type.title, isSelected: foyerVM.selectedType == type) {
                                        foyerVM.selectedType = type
                                    }
                                }
                            }
                        }
                    }
                
                    //MEMBRES DU FOYER
                    HStack {
                        Text("Membres du foyer (\(foyerVM.membresCount))")
                            .font(.custom("Parkinsans-SemiBold", size: 20))
                            .padding(.top, 10)
                        Spacer()
                        
                        SmallCircleButton(imageSystemName: "plus") {
                            
                            if foyerVM.membresDuFoyer.isEmpty {
                                navVM.path.append(AppRoute.createProfile)
                            }
                        }
                    }.padding(.horizontal, 10)
                    
                    if foyerVM.membresDuFoyer.isEmpty {
                        
                        VStack {
                            Spacer()
                            Text("Il n'y a pas encore de membres, veuillez créer votre profil membre")
                                .font(Font.custom("Parkinsans-Regular", size: 14))
                                .foregroundStyle(Color(.lightGrey200))
                                .multilineTextAlignment(.center)
                            
                            Spacer()
                        }
                    } else {
                        ForEach(foyerVM.membresDuFoyer, id: \.self) { membre in
                            Text(membre.nom)
                            Spacer()
                        }
                    }
                }
                Spacer()
            }
            .padding(.vertical, 20)
        }
        .padding()
    }
}

#Preview {
    CreateFoyer()
        .environment(NavigationViewModel())
        .environment(FoyerViewModel())
}
