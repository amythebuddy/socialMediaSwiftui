//
//  PostView.swift
//  socialMedia
//
//  Created by StudentAM on 5/3/24.
//

import SwiftUI

struct PostView: View {
    var post : Post
    @State var like = false
    var body: some View {
        VStack{
            HStack{
                Circle()
                    .frame(width: 60, height: 60)
                    .padding()
                Text(post.userName)
                    .font(.system(size: 20))
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            Image(post.userImage)
                .resizable()
                .scaledToFit()
                .frame(height: .infinity)
                .clipShape(Rectangle())
            HStack{
                Button {
                    like.toggle()
                    
                } label: {
                    Image(systemName: like ? "heart.fill" : "heart")
                        .font(.system(size: 25))
                        .padding()
                }
                Button {
                    
                } label: {
                    Image(systemName: "message")
                        .font(.system(size: 23))
                        .padding(.horizontal, -10)
                }
            }
            .padding(.vertical, -15)
            .frame(maxWidth: .infinity, alignment: .leading)
            HStack {
                Text(post.userName)
                    .padding()
                    .fontWeight(.bold)
                    .font(.system(size: 20))
                Text(post.caption)
                    .padding(.horizontal, -10)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.vertical, -15)

        }
    }
}

#Preview {
    PostView(post: Post(userName: "ha", userImage: "prettysunrise", caption: "Good morning", hasImage: true))
}
