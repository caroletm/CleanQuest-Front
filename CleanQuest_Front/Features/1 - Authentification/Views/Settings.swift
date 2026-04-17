//
//  Settings.swift
//  CleanQuest_Front
//
//  Created by caroletm on 14/04/2026.
//

import SwiftUI

struct Settings: View {
    
    @Environment(NavigationViewModel.self) var navVM
    @Environment(AuthViewModel.self) var authVM
    
    @State var showLogOutAlert: Bool = false
    
    var body: some View {
        
        
        VStack(alignment: .leading, spacing: 20) {
            
            Text("Paramètres")
                .font(.custom("Parkinsans-Bold", size: 28))
                .padding(.top, 10)
                .padding(.vertical, 10)
            
            ForEach(SettingsSection.allCases, id: \.self) { section in
                
                Text(section.title)
                    .font(.custom("Parkinsans-Bold", size: 20))
                
                ForEach(section.items, id: \.self) { item in
                    Button(item.title) {
                        if let route = item.route {
                            navVM.path.append(route)
                        }
                    }
                    .font(Font.custom("Parkinsans-Regular", size: 16))
                    .foregroundStyle(Color(.black))
                }
                
                Divider()
            }
            Button {
                showLogOutAlert.toggle()
            }label : {
                Text("Se déconnecter")
                    .font(.custom("Parkinsans-Bold", size: 20))
                    .foregroundStyle(Color(.red.opacity(0.9)))
                    .underline(true)
                    .padding(.vertical, 15)
            }
            
            HStack {
                Spacer()
                PrimaryButton(text: "Retour", width: 125, height: 50) { navVM.path.removeLast()}
                Spacer()
            }
            .padding(10)
        }
        .padding(20)
        .navigationBarHidden(true)
        .alert("Se déconnecter", isPresented: $showLogOutAlert) {
            Button("Annuler", role: .cancel) { }
            Button("Se déconnecter", role: .destructive) {
                navVM.path = NavigationPath()
                authVM.logout()
            }
        } message: {
            Text("Es-tu sûr de vouloir te déconnecter ?")
        }
    }
}

#Preview {
    Settings()
        .environment(NavigationViewModel())
        .environment(AuthViewModel(userVM: UserViewModel()))
}
