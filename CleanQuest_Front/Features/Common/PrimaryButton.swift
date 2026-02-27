//
//  CapsuleButton.swift
//  CleanQuest
//
//  Created by caroletm on 24/02/2026.
//

import SwiftUI

struct PrimaryButton : View {
    
    var text: String
    var width: CGFloat
    var height: CGFloat
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            
            ZStack {
                RoundedRectangle(cornerRadius: 50)
                    .frame(width: width, height: height)
                    .foregroundStyle(Color.black)
                Text(text)
                    .foregroundColor(.white)
                    .font(.custom("Parkinsans-Bold", size: 16))
            }
        }
    }
}

#Preview {
    PrimaryButton(text: "Se connecter", width : 300, height : 50, action: {})
}
