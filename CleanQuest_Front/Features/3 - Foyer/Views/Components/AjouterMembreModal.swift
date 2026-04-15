//
//  AjouterMembreModal.swift
//  CleanQuest_Front
//
//  Created by caroletm on 15/04/2026.
//

import SwiftUI

struct AjouterMembreModal: View {
    
    @Environment(FoyerViewModel.self) var foyerVM: FoyerViewModel
    @State var currentStep = 0
    
    var body: some View {
        
        @Bindable var foyerVM = foyerVM
        
        ZStack {
            Color.lightMauve100.ignoresSafeArea()
            
            VStack (spacing : 20) {
                Text("Ajoute un membre")
                    .font(.custom("Parkinsans-SemiBold", size: 24))
                
                
                if currentStep == 0 {
                    
                    VStack (alignment : .leading){
                        
                        HStack {
                            
                            Text("Géré par moi même")
                                .font(.custom("Parkinsans-SemiBold", size: 16))
                            Image(systemName: "link")
                            Spacer()
                            Toggle("", isOn: $foyerVM.isGere)
                        }
                        
                        if foyerVM.isGere {
                            Text("Ce membre n'aura pas de compte")
                                .font(.custom("Parkinsans-Regular", size: 14))
                        }
                    }
                    .padding(.vertical,10)
                    
                    if !foyerVM.isGere {
                        
                        VStack  {
                            
                            FormSection(title: "Son nom", text: $foyerVM.nomMembre, placeholder: "nom")
                            
                            Spacer()
                                .frame(height: 15)
                            
                            FormSection(title: "Son email", text: $foyerVM.emailMembre, placeholder: "email")
                        }
                        .padding()
                        
                        PrimaryButton(text: "Envoyer une invitation", width: 220, height: 50) {
                            
                            foyerVM.addNewMember(nom: foyerVM.nomMembre, couleur: foyerVM.selectedCouleurMembre ?? Color(.lightGrey100), avatar: foyerVM.selectedAvatarMembre ?? "", niveau: .debutant, isGere: false, email: foyerVM.emailMembre)
                            
                            foyerVM.clearForm()
                            
                            foyerVM.showAddMemberSheet.toggle()
                        }
                    } else {
                        
                        VStack{
                            
                            FormSection(title: "Son nom", text: $foyerVM.nomMembre, placeholder: "nom")
                        
                         
                            HStack {
                                Text("Son avatar et sa couleur")
                                    .font(.custom("Parkinsans-SemiBold", size: 16))
                                Spacer()
                                Button {
                                    currentStep += 1
                                }label: {
                                    Image(systemName: "arrow.right.circle")
                                        .font(Font.largeTitle)
                                        .foregroundStyle(Color(.black))
                                }
                            }
                            .padding(.vertical, 10)
                            
                            //IMAGE DU MEMBRE SI SELECTIONNE
                            
                            if foyerVM.selectedAvatarMembre != nil && foyerVM.selectedCouleurMembre != nil {
                                
                                ZStack {
                                    Circle()
                                        .fill(foyerVM.selectedCouleurMembre ?? Color(.lightGrey100))
                                        .frame(width: 47, height: 47)
                                        .overlay {
                                            Circle()
                                                .stroke(Color.black, lineWidth: 1)
                                            
                                        }
                                    Image(foyerVM.selectedAvatarMembre ?? "")
                                        .resizable()
                                        .frame(width: 30, height: 30)
                                        .clipShape(Circle())
                                }
                                .padding(.bottom, 10)
                                
                            }
                            PrimaryButton(text: "Gérer ce membre", width: 220, height: 50) {
                                
                                foyerVM.addNewMember(nom: foyerVM.nomMembre, couleur: foyerVM.selectedCouleurMembre ?? Color(.lightGrey100), avatar: foyerVM.selectedAvatarMembre ?? "", niveau: .debutant, isGere: true, email: "")
                                
                                foyerVM.clearForm()
                                
                                foyerVM.showAddMemberSheet.toggle()
                                
                            }
                        }
                        .padding()
                    }
                } else if currentStep == 1 {
                    
                    ModalSelectMemberColors(currentStep: $currentStep)
                }
            }
            .padding()
        }
    }
}

#Preview {
    AjouterMembreModal()
        .environment(FoyerViewModel())
}
