//
//  BoutonFoyer.swift
//  CleanQuest_Front
//
//  Created by caroletm on 16/04/2026.
//
import SwiftUI

struct BoutonFoyer: View {
    
    var title : String
    var memberCount : Int
    var deleteAction : () -> Void
    var action : () -> Void
 
    var body: some View {
        
        Button {
            action()
        }label : {
            
            HStack {
                Image(.family)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 55, height: 55)
                
                VStack (alignment: .leading) {
                    Text(title)
                        .font(.custom("Parkinsans-SemiBold", size: 20))
                    Text("\(memberCount) membres")
                        .font(.custom("Parkinsans-Regular", size: 14))
                }
                Spacer()
                
                Button {
                    deleteAction()
                }label: {
                    ZStack {
                        Circle()
                            .stroke(.lightGrey200, lineWidth: 0.5)
                        
                        Image(systemName: "xmark.bin")
                            .foregroundColor(.black)
                            .padding(5)
                    }
                }
                .frame(width: 40, height: 40)
            }
            .padding(15)
            .foregroundStyle(Color(.black))
            .background(Color.white)
            .clipShape(RoundedRectangle(cornerRadius: 30))
            .overlay {
                RoundedRectangle(cornerRadius: 30)
                    .stroke(.lightGrey200, lineWidth: 0.5)
            }
        }
    }
}

#Preview {
    BoutonFoyer(title: "La tribu Trem", memberCount: 10, deleteAction: {}, action: {})
}


