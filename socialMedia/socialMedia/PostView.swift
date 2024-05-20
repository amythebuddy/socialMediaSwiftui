//
//  PostView.swift
//  socialMedia
//
//  Created by StudentAM on 5/3/24.
//

import SwiftUI


struct PostView: View {
    @Binding var post : Post
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
                        if like == true {
                            post.amountOfLikes += 1
                        } else {
                            post.amountOfLikes -= 1
                        }
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

                // if there is like and amount of like is 0, then display the like
                if like == true && (post.amountOfLikes == 0 || post.amountOfLikes == 1){
                    Text("\(post.amountOfLikes) like")
                        .font(.system(size: 20))
                        .padding(.vertical, -10)
                        .padding(.horizontal)
                        .frame(maxWidth: .infinity, alignment: .leading)
                
//                    else if post.amountOfLikes == 1{
//                    Text("\(post.amountOfLikes) like")
//                        .font(.system(size: 20))
//                        .padding(.vertical, -10)
//                        .padding(.horizontal)
//                        .frame(maxWidth: .infinity, alignment: .leading)
                } else {
                    Text("\(post.amountOfLikes) likes")
                        .font(.system(size: 20))
                        .padding()
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                
                HStack {
                    Text(post.userName)
                        .padding()
                        .fontWeight(.bold)
                        .font(.system(size: 20))
                    Text(post.caption)
                        .padding(.horizontal, -10)
                }
                .padding(.bottom, -10)
                .frame(maxWidth: .infinity, alignment: .leading)
                Divider()
            }
            
        }
    }
}


#Preview {
    PostView(post: .constant(Post(userName: "hac", avatar: "hacavatar", userImage: "prettysunrise", amountOfLikes: 0, caption: "Good morning everyone!", hasImage: true)))
}
