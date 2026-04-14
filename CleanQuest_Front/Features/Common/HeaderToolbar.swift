//
//  HeaderToolbar.swift
//  CleanQuest_Front
//
//  Created by caroletm on 14/04/2026.
//

import SwiftUI

struct HeaderToolbar: View {
    
    var text : String
    var action: () -> Void
    
    var body: some View {
        
        HStack {
            Text(text)
                .font(.custom("Parkinsans-Bold", size: 28))
            Spacer()
            SmallCircleButton(imageSystemName: "gear") {
               action()
            }
        }
    }
}

#Preview {
    HeaderToolbar(text: "Nouveau", action: {})
}
