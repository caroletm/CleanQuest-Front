//
//  NameStep.swift
//  CleanQuest
//
//  Created by caroletm on 26/02/2026.
//

import SwiftUI

struct AvatarStep: View {
    
    var avatarImages : [ImageResource] = [.avatar1, .avatar2, .avatar3, .avatar4,.avatar5,.avatar6,.avatar7, . avatar8, .avatar9, .avatar10]
    @Binding var selectedColor : Color
    @Binding var name : String
    @Binding var selectedAvatar : ImageResource
    
    var body: some View {
        
        VStack {
            
            ZStack{
                Circle()
                    .frame(width: 150, height: 150)
                    .foregroundColor(selectedColor)
                Image(selectedAvatar)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100)
            }
            
            Text(name)
                .font(.custom("Parkinsans-SemiBold", size: 24))
                .padding()
            
            LazyVGrid(
                columns: Array(repeating: GridItem(.fixed(65), spacing: 4), count: 5),
                spacing: 10
            ) {
                ForEach(avatarImages, id: \.self) { avatar in
                    Button {
                        selectedAvatar = avatar
                    } label: {
                        Image(avatar)
                            .resizable()
                            .scaledToFit()
                        
                    }
                }
            }
        }
    }
}

#Preview {
    AvatarStep(selectedColor: .constant(.lightGrey100), name: .constant("Hello"), selectedAvatar: .constant(.avatar1))
}
