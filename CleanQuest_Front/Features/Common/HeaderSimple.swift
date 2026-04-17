//
//  HeaderSimple.swift
//  CleanQuest_Front
//
//  Created by caroletm on 16/04/2026.
//

import SwiftUI

struct HeaderSimple: View {
    
    var text : String
    
    var body: some View {
        HStack {
            Text(text)
                .font(.custom("Parkinsans-Bold", size: 28))
            Spacer()
        }
    }
}
