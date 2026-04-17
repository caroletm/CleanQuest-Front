//
//  FormSection.swift
//  CleanQuest_Front
//
//  Created by caroletm on 15/04/2026.
//

import SwiftUI

struct FormSection: View {
    
    var title : String
    @Binding var text : String
    var placeholder : String
    
    var body: some View {
        HStack {
            Text(title)
                .font(.custom("Parkinsans-SemiBold", size: 16))
            Spacer()
        }
        
        Textfield(text: $text, placeholder: placeholder)
    }
}

#Preview {
    FormSection(title: "son nom", text: .constant(""), placeholder: "nom")
}
