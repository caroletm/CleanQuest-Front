//
//  NameStep.swift
//  CleanQuest
//
//  Created by caroletm on 26/02/2026.
//

import SwiftUI

struct AvatarStep: View {
    
    var avatarImages : [ImageResource] = [.avatar1, .avatar2, .avatar3, .avatar4,.avatar5,.avatar6,.avatar7, . avatar8, .avatar9, .avatar10]
    @Binding var selectedColor : Color?
    @Binding var name : String
    @Binding var selectedAvatar : ImageResource?
    
    var body: some View {
        GeometryReader { geo in
            VStack {
                ZStack {
                    Circle()
                        .frame(width: geo.size.width * 0.35, height: geo.size.width * 0.35)
                        .foregroundColor(selectedColor ?? .lightGrey100)
                    
                    if let avatar = selectedAvatar {
                          Image(avatar)
                              .resizable()
                              .scaledToFit()
                              .frame(width: geo.size.width * 0.23, height: geo.size.width * 0.23)
                      }
                }

                Text(name)
                    .font(.custom("Parkinsans-SemiBold", size: 24))
                    .padding()
                    .padding(.bottom, geo.size.width * 0.1)

                LazyVGrid(
                    columns: Array(repeating: GridItem(.flexible(), spacing: 4), count: 5),
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
                .padding(.horizontal)
            }
            .frame(width: geo.size.width, alignment: .center)
        }
    }
}

#Preview {
    AvatarStep(selectedColor: .constant(.lightGrey100), name: .constant("Hello"), selectedAvatar: .constant(.avatar1))
}
