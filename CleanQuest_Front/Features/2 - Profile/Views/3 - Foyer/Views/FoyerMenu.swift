//
//  FoyerMenu.swift
//  CleanQuest_Front
//
//  Created by caroletm on 14/04/2026.
//

import SwiftUI
import Foundation

struct FoyerMenu: View {
    
    @Environment(NavigationViewModel.self) var navVM
    
    var body: some View {
        
        
        ZStack {
            Color(.lightYellow100)
                .ignoresSafeArea(edges: .all)
            
            VStack(alignment : .leading) {
                HeaderToolbar(text: "") {
                    navVM.path.append(AppRoute.settings)
                }
                Spacer()
                
                Image(.mainHouse)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 80)
                    .padding(10)
                
                PrimaryButton (text: "Créer un foyer", width: 160, height: 50) {
                    navVM.path.append(AppRoute.createFoyer)
                }
                PrimaryButton (text: "Rejoindre un foyer", width: 190, height: 50) {
                    navVM.path.append(AppRoute.joinFoyer)
                }
                Spacer()
            }
            .padding()
            
        }
    }
}

#Preview {
    FoyerMenu()
        .environment(NavigationViewModel())
}
