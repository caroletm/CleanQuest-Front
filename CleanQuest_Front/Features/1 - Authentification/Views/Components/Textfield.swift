//
//  TextfieldEmail.swift
//  CleanQuest
//
//  Created by caroletm on 25/02/2026.
//

import SwiftUI

struct Textfield : View {
    
    @Binding var text: String
    
    var placeholder : String
    
    var body: some View {
        
        TextField(placeholder, text: $text)
            .padding(5)
            .autocapitalization(.none)
            .keyboardType(.emailAddress)
            .padding(.horizontal, 10)
            .padding(.vertical, 5)
            .overlay {
                RoundedRectangle(cornerRadius: 50)
                    .stroke(style: StrokeStyle(lineWidth: 1))
            }
            .foregroundStyle(Color(.lightGrey200))
    }
}

#Preview {
    Textfield(text: .constant("email"), placeholder: "email")
}
