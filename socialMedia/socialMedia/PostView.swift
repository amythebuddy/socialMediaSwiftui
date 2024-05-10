//
//  PostView.swift
//  socialMedia
//
//  Created by StudentAM on 5/3/24.
//

import SwiftUI


struct PostView: View {
//    var post : Post
    var user: User
    @State var showView = false
    @State private var userFound = false
    @State var like = false
    var body: some View {
        NavigationView{
            VStack{
                if user.post[0].hasImage == true {
                    Image(user.post[0].userImage)
                        .resizable()
                        .scaledToFit()
                        .frame(height: 300)
                        .clipShape(Rectangle())
                } else {
                    Text(user.post[0].caption)
                        .frame(width: 350, height: 250)
                        .background(.gray.opacity(0.1))
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
                    Text(user.post[0].userName)
                        .padding()
                        .fontWeight(.bold)
                        .font(.system(size: 20))
                    Text(user.post[0].caption)
                        .padding(.horizontal, -10)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.vertical, -6)
                Divider()
                    .frame(height: 4)
                    .overlay(.gray)
            }
            
        }
    }
}


#Preview {
    PostView(user: User(username: "hac", password: "123", profile: Profile(userName: "hac", avatar: "hacavatar", following: 90, followers: 10, posts: 2), post: [Post(userName: "hac", avatar: "hacavatar", userImage: "prettysunrise", caption: "Good morning everyone!", hasImage: true)]))
}
