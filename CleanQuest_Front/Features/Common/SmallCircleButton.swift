//
//  SmallCircleButton.swift
//  CleanQuest
//
//  Created by caroletm on 26/02/2026.
//

import SwiftUI

struct SmallCircleButton : View {
    
    let imageSystemName: String
    let action: () -> Void
    
    var body: some View {
        
        Button(action: action) {
            
            ZStack {
                Circle()
                    .frame(width: 42, height: 42)
                    .foregroundStyle(Color(.black))
                Image(systemName: imageSystemName)
                    .font(.system(size: 24, weight: .bold))
                    .foregroundColor(.white)
            }
        }
    }
}

#Preview {
    SmallCircleButton(imageSystemName: "gear", action: {})
}
