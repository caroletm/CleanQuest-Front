//
//  TextfieldEmail.swift
//  CleanQuest
//
//  Created by caroletm on 25/02/2026.
//

import SwiftUI

struct TextfieldPassword : View {
    
    @Binding var text: String
    @Binding var isPasswordVisible: Bool
    
    var placeholder : String
    
    var body: some View {
        
        HStack {

            if isPasswordVisible {
                TextField(placeholder, text: $text)
                    .padding(5)
                    .autocapitalization(.none)
            } else {
                SecureField(placeholder, text: $text)
                    .padding(5)
                    .autocapitalization(.none)
            }
            
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
    TextfieldPassword(text: .constant("email"), isPasswordVisible: .constant(false), placeholder: "email")
}
