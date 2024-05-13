//
//  PostView.swift
//  socialMedia
//
//  Created by StudentAM on 5/3/24.
//

import SwiftUI


struct PostView: View {
    var post : Post
    @State private var showView = false // to change the view
    @State private var like = false // to change the heart
    var body: some View {
        NavigationView{
            VStack{
                if post.hasImage == true { // if post has image
                    Image(post.userImage) // display the image
                        .resizable()
                        .scaledToFit()
                        .frame(height: 300)
                        .clipShape(Rectangle())
                } else {
                    Text(post.caption) // only display text
                        .frame(width: 350, height: 250)
                        .background(.gray.opacity(0.1))
                        .font(.system(size: 20))
                        .cornerRadius(10)
                }
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
                .padding(.vertical, -6)
                Divider()
            }
            
        }
    }
}


#Preview {
    PostView(post: Post(userName: "hac", avatar: "hacavatar", userImage: "prettysunrise", caption: "Good morning everyone!", hasImage: true))
}
