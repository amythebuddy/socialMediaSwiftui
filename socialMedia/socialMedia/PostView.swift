//
//  PostView.swift
//  socialMedia
//
//  Created by StudentAM on 5/3/24.
//

import SwiftUI


struct PostView: View {
    var post : Post
    @State var profiles: [Profile] = [
    Profile(userName: "hac", avatar: "hacavatar", following: 90, followers: 10, posts: 2),
    Profile(userName: "amy", avatar: "amyavatar", following: 10, followers: 20, posts: 1),
    Profile(userName: "Daily Meme", avatar: "healTheWorld", following: 0, followers: 100, posts: 5)
    ]
    @State var showView = false
    @State private var userFound = false
    @State var like = false
    var body: some View {
        NavigationView{
            VStack{
                HStack{
                    ForEach(profiles, id: \.self) { profile in
                        if profile.userName == post.userName {
                            Button(action: {
                                searchProfile(userName: profile.userName)
                            }, label: {
                                Image(post.avatar)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 60, height: 60)
                                    .clipShape(Circle())
                                    .padding(.horizontal, 10)
                                Text(post.userName)
                                    .font(.system(size: 20))
                                
                            })
                            NavigationLink(destination: AccountPage(profile: profile), isActive: $showView){
                                EmptyView()
                            }
                            //                            NavigationLink(destination: AccountPage(profile: )){
                            //                                Image(post.avatar)
                            //                                    .resizable()
                            //                                    .scaledToFit()
                            //                                    .frame(width: 60, height: 60)
                            //                                    .clipShape(Circle())
                            //                                    .padding(.horizontal, 10)
                            //                                Text(post.userName)
                            //                                    .font(.system(size: 20))
                            //                        }
                        }
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                if post.hasImage == true {
                    Image(post.userImage)
                        .resizable()
                        .scaledToFit()
                        .frame(height: .infinity)
                        .clipShape(Rectangle())
                } else {
                    Text(post.caption)
                        .frame(width: 350, height: 60)
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
                    .frame(height: 4)
                    .overlay(.gray)
            }
            .padding(.vertical, 10)
        }
    }
    func searchProfile(userName: String){
        
    }
}


#Preview {
    PostView(post: Post(userName: "hac", avatar: "hacavatar", userImage: "prettysunrise", caption: "Good morning", hasImage: true))
}
