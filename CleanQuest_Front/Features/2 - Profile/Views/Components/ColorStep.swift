//
//  NameStep.swift
//  CleanQuest
//
//  Created by caroletm on 26/02/2026.
//

import SwiftUI

struct ColorStep: View {
    
    @Binding var selectedColor : Color
    @Binding var name : String

    
    var colorsTheme : [Color] = [.lightMauve100, .lightSky100, .lightRose100, .lightGreen100, .lightBlue100, .lightRed100, .lightOrange100, .lightYellow100]
    
    var body: some View {
        
        VStack {
            
            Circle()
                .frame(width: 150, height: 150)
                .foregroundColor(selectedColor)
            
            Text(name)
                .font(.custom("Parkinsans-SemiBold", size: 24))
                .padding()

            
            Text("Choisis ta couleur")
                .font(.custom("Parkinsans-SemiBold", size: 24))
                .padding(50)
            
            LazyVGrid(
                columns: Array(repeating: GridItem(.fixed(65), spacing: 10), count: 4),
                spacing: 10
            ) {
                ForEach(colorsTheme, id: \.self) { color in
                    Button {
                        selectedColor = color
                    } label: {
                        Circle()
                            .frame(width: 60, height: 60)
                            .foregroundColor(color)
                    }
                }
            }
        }
    }
}

#Preview {
    ColorStep(selectedColor: .constant(.lightGrey100), name: .constant("Carole"))
}
