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
    @Environment(UserViewModel.self) var userVM
    
    
    var body: some View {
        
        @Bindable var foyerVM = foyerVM
        
        VStack {
            
            HeaderToolbar(text: "Nouveau foyer") {
                navVM.path.append(AppRoute.settings)
            }
            
            Image(.family)
                .resizable()
                .scaledToFit()
                .frame(width: 71)
            
            Text(foyerVM.nomFoyer.isEmpty ? "Nom du foyer" : foyerVM.nomFoyer)
            
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
                        }else {
                            foyerVM.showAddMemberSheet.toggle()
                        }
                    }
                }.padding(.horizontal, 10)
                
                if foyerVM.membresDuFoyer.isEmpty {
                    
                    VStack {
                        Spacer()
                        Text("Il n'y a pas encore de membres, veuillez créer votre profil puis ajoutez les autres membres.")
                            .font(Font.custom("Parkinsans-Regular", size: 14))
                            .foregroundStyle(Color(.lightGrey200))
                            .multilineTextAlignment(.center)
                        
                        Spacer()
                    }
                } else {
                    ScrollView {
                        
                        ForEach(foyerVM.membresDuFoyer, id: \.self) { membre in
                            
                            if foyerVM.membresDuFoyer.first == membre {
                                MemberLine(nom: membre.nom, email: "", couleur: userVM.selectedColor ?? .lightGrey100, avatar: membre.avatar ?? "", info: "toi", isGere: membre.estGere)
                                
                            }else {
                                MemberLine(nom: membre.nom, email: membre.email ?? "", couleur: membre.couleur ?? .lightGrey30, avatar: membre.avatar ?? "", info: membre.estGere ? "géré par \(userVM.nom)" : "invité", isGere: membre.estGere)
                                }
                            
                            Spacer()
                        }
                    }
                }
            }
            Spacer()
            
            PrimaryButton(text: "Créer un foyer", width: 150, height: 50) {}
            SecondaryButton(text: "Retour", width: 150, height: 50) {
                navVM.path.removeLast()
            }
        }
        .padding()
        .navigationBarBackButtonHidden()
        .sheet(isPresented: $foyerVM.showAddMemberSheet) {
            AjouterMembreModal()
            .presentationDetents([.fraction(0.6)])}
        
    }
}

#Preview {
    CreateFoyer()
        .environment(NavigationViewModel())
        .environment(FoyerViewModel())
        .environment(UserViewModel())
}
