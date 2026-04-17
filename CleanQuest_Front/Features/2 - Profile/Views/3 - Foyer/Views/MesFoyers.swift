//
//  MesFoyers.swift
//  CleanQuest_Front
//
//  Created by caroletm on 16/04/2026.
//

import SwiftUI

struct MesFoyers : View {
    
    @Environment(FoyerViewModel.self) var foyerVM
    @Environment(NavigationViewModel.self) var navVM
    
    var body: some View {
        
        ZStack {
            Color.lightBlue100.ignoresSafeArea()
            
            VStack {
                HeaderSimple(text: "Mes foyers")
                
                //FOREACH
                
                if foyerVM.foyers.isEmpty {
                    VStack {
                        Spacer()
                        Text("Vous n'avez pas encore de foyer.\nAjoutez-en un !")
                            .font(.custom("Parkinsans-Regular", size: 16))
                            .multilineTextAlignment(.center)
                        Spacer()
                    }
                } else {
                    
                    ForEach(foyerVM.foyers ) { foyer in
                        BoutonFoyer(title: foyer.nom, memberCount: foyer.membres.count, deleteAction: {}, action: {})
                    }
                    
                }
                
                Spacer()
                
                PrimaryButton(text: "Ajouter", width: 120, height: 50) {
                    navVM.path.append(AppRoute.createFoyer)
                }
                SecondaryButton(text: "Retour", width: 120, height: 50) {
                    navVM.path.removeLast()
                }
            }
            .padding()
            .navigationBarBackButtonHidden()
        }
        .onAppear {
            Task {
                await foyerVM.fetchFoyers()
            }
        }
    }
}

#Preview {
    MesFoyers()
        .environment(FoyerViewModel())
        .environment(NavigationViewModel())
}
