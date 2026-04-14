//
//  SmallOptionButton.swift
//  CleanQuest_Front
//
//  Created by caroletm on 14/04/2026.
//

import SwiftUI

struct SmallOptionButton : View {
    
    var text: String
    var isSelected : Bool
    let action: () -> Void
    
    
    var body: some View {
        
        Button(action: action) {
            if isSelected {
                Text(text)
                    .foregroundColor(.white)
                    .font(.custom("Parkinsans-SemiBold", size: 14))
                    .lineLimit(1)
                    .padding(.horizontal, 16)
                    .padding(.vertical, 4)
                    .background(
                        Capsule()
                        .foregroundStyle(Color.black))
            } else {
                Text(text)
                    .foregroundColor(.lightGrey200)
                    .font(.custom("Parkinsans-Regular", size: 14))
                    .lineLimit(1)
                    .padding(.horizontal, 16)
                    .padding(.vertical, 4)
                    .background(Capsule().foregroundStyle(Color.white))
                    .overlay {
                        Capsule()
                            .stroke(style: StrokeStyle(lineWidth: 0.5))
                            .foregroundColor(Color.black)
                    }
            }
        }
    }
}


#Preview {
    SmallOptionButton(text: "Famille avec enfants", isSelected : false, action: {})
}
