//
//  NameStep.swift
//  CleanQuest
//
//  Created by caroletm on 26/02/2026.
//

import SwiftUI

struct ColorStep: View {
    
    @Binding var selectedColor : Color?
    @Binding var name : String
    
    var colorsTheme : [Color] = [.lightMauve100, .lightSky100, .lightRose100, .lightGreen100, .lightBlue100, .lightRed100, .lightOrange100, .lightYellow100]
    
    var body: some View {
        GeometryReader { geo in
            VStack {
                Circle()
                    .frame(width: geo.size.width * 0.35, height: geo.size.width * 0.35)
                    .foregroundColor(selectedColor ?? .lightGrey100)

                Text(name)
                    .font(.custom("Parkinsans-SemiBold", size: 24))
                    .padding()

                Text("Choisis ta couleur")
                    .font(.custom("Parkinsans-SemiBold", size: 24))
                    .padding()

                LazyVGrid(
                    columns: Array(repeating: GridItem(.flexible(), spacing: 10), count: 4),
                    spacing: 10
                ) {
                    ForEach(colorsTheme, id: \.self) { color in
                        Button {
                            selectedColor = color
                        } label: {
                            Circle()
                                .aspectRatio(1, contentMode: .fit)
                                .foregroundColor(color)
                        }
                    }
                }
                .padding(.horizontal)
            }
            .frame(width: geo.size.width, alignment: .center)
        }
    }
}

#Preview {
    ColorStep(selectedColor: .constant(.lightGrey100), name: .constant("Carole"))
}
