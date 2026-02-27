//
//  NameStep.swift
//  CleanQuest
//
//  Created by caroletm on 26/02/2026.
//

import SwiftUI

struct NameStep: View {
    
    @Binding var pseudo: String
    
    var body: some View {
        
        VStack {
            
            Text("Choisis ton nom")
                .font(.custom("Parkinsans-SemiBold", size: 24))
            
            Textfield(text: $pseudo, placeholder: "nom")
                .padding(30)
        }
    }
}

#Preview {
    NameStep(pseudo: .constant("Carole"))
}
