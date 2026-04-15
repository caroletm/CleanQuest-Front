//
//  CapsuleButton.swift
//  CleanQuest
//
//  Created by caroletm on 24/02/2026.
//

import SwiftUI

struct SecondaryButton : View {
    
    var text: String
    var width: CGFloat
    var height: CGFloat
    let action: () -> Void
    
    var body: some View {
        
        Button(action: action) {
            Text(text)
                .foregroundColor(.black)
                .font(.custom("Parkinsans-SemiBold", size: 16))
                .frame(width: width, height: height)
                .background(Color.white)
                .clipShape(Capsule())
               
        }
        .overlay{
            RoundedRectangle(cornerRadius: 50)
                .stroke(style: StrokeStyle(lineWidth: 0.5))
                .frame(width: width, height: height)
                .foregroundColor(Color.black)
        }
    }
}

#Preview {
    SecondaryButton(text: "Se connecter", width : 300, height : 50, action: {})
}
