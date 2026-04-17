//
//  MembreLine.swift
//  CleanQuest_Front
//
//  Created by caroletm on 15/04/2026.
//

import SwiftUI

struct MemberLine: View {
    
    var nom : String
    var email : String
    var couleur : Color
    var avatar : String
    var info : String
    var isGere : Bool
    
    var body: some View {
        
        
        HStack{
            
            ZStack {
                Circle()
                    .fill(isGere ? couleur : .lightGrey100)
                    .frame(width: 47, height: 47)
                
                if isGere {
                    
                    Image(avatar)
                        .resizable()
                        .frame(width: 30, height: 30)
                        .clipShape(Circle())
                } else {
                    Image(systemName: "person.fill")
                        .resizable()
                        .frame(width: 20, height: 20)
                        .foregroundColor(.gray)
                }
            }
            VStack(alignment: .leading) {
                Text(nom)
                    .font(.custom("Parkinsans-SemiBold", size: 16))
                    .foregroundColor(.black)
                
                if !isGere {
                    Text(email)
                        .font(.custom("Parkinsans-Regular", size: 14))
                        .foregroundColor(.lightGrey200)
                }
            }
            .padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 0))
            
            Spacer()
            
            SmallOptionButton(text: info, isSelected: false) {}
                .disabled(true)
        }
    }
}

#Preview {
    MemberLine(nom: "hello", email: "email@email.com", couleur: .brightGreen100, avatar: "avatar8", info: "toi", isGere: false)
}
