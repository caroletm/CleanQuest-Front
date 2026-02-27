//
//  SecurefieldPassword.swift
//  CleanQuest
//
//  Created by caroletm on 25/02/2026.
//

import SwiftUI

struct SecurefieldPassword : View {
    
    @Binding var text: String
    @Binding var isPasswordVisible : Bool
    
    var body: some View {
        
        HStack {

            SecureField("mot de passe", text: $text)
                .padding(5)
                .textContentType(.emailAddress)
                .autocapitalization(.none)
                .keyboardType(.emailAddress)
            
            Button {
                isPasswordVisible.toggle()
            }label: {
                Image(systemName: isPasswordVisible ? "eye.slash" : "eye")
                    .foregroundColor(isPasswordVisible ? .black : .lightGrey200)
            }
            .padding(.trailing, 5)
        }
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
    SecurefieldPassword(text: .constant("mot de passe"), isPasswordVisible: .constant(false))
}
