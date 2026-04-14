//
//  JoinFoyer.swift
//  CleanQuest_Front
//
//  Created by caroletm on 14/04/2026.
//

import SwiftUI

struct JoinFoyer: View {
    @Environment(NavigationViewModel.self) var navVM
    @Environment(FoyerViewModel.self) var foyerVM
    
    var body: some View {
        
        @Bindable var foyerVM = foyerVM
        
        ZStack {
            Color(.lightMauve100)
                .ignoresSafeArea(edges: .all)
            
            VStack(alignment : .leading) {
                HeaderToolbar(text: "Mon foyer") {
                    navVM.path.append(AppRoute.settings)
                }
                Spacer()
                
                Image(.family)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 80)
                
                Text("Entre le code du foyer pour le rejoindre")
                    .font(.custom("Parkinsans-Regular", size: 14))
                    .padding(5)
                
                TextField("code du foyer", text: $foyerVM.codeFoyer)
                    .padding(5)
                    .autocapitalization(.none)
                    .padding(.horizontal, 10)
                    .padding(.vertical, 5)
                    .frame(maxWidth: 150)
                    .background(Color.white)
                    .clipShape(Capsule())
                    .overlay {
                        RoundedRectangle(cornerRadius: 50)
                            .stroke(style: StrokeStyle(lineWidth: 1))
                    }
                    .foregroundStyle(Color(.lightGrey200))
            
                Spacer()
                
                HStack {
                    Spacer()
                    PrimaryButton(text: "Rejoindre le foyer", width: 185, height : 50) {
                        //
                    }
                    Spacer()
                }
            }
            .padding()
        }
    }
}

#Preview {
    JoinFoyer()
        .environment(NavigationViewModel())
        .environment(FoyerViewModel())
}
