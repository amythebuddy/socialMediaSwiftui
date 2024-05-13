//
//  UserProfile.swift
//  socialMedia
//
//  Created by StudentAM on 5/10/24.
//

import SwiftUI

struct UserProfile: View {
    @Binding var loggedIn: User
    @Binding var users: [User]
    @State private var showView = false
    var body: some View {
        NavigationView{
            VStack{
                HStack{ // display avatar, username, amount of post, followers, following
                    VStack {
                        Image(loggedIn.profile.avatar)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 70, height: 70)
                            .clipShape(Circle())
                            .padding(.horizontal, 10)
                        Text(loggedIn.username)
                            .font(.system(size: 20))
                    }
                    .padding(.horizontal)
                    VStack {
                        Text("\(loggedIn.profile.posts)")
                            .font(.system(size: 20))
                        Text("Posts")
                    }
                    .padding()
                    
                    VStack {
                        Text("\(loggedIn.profile.followers)")
                            .font(.system(size: 20))
                        Text("Followers")
                    }
                    .frame(width: 80)
                    .padding(.trailing, -20)
                    VStack {
                        Text("\(loggedIn.profile.following)")
                            .font(.system(size: 20))
                        Text("Following")
                    }
                    .padding(20)
                }
                Button(action: {
                    showView = true
                }, label: {
                    Text("Edit")
                        .foregroundColor(.white)
                        .font(.custom("BebasNeue-Regular", size: 40))
                        .frame(maxWidth: 200, maxHeight: 50)
                        .background(Color.purple)
                        .cornerRadius(50)
                })
                .padding()
                NavigationLink(destination: EditUserProfile(loggedIn: $loggedIn, users: $users), isActive: $showView){ // go to another page with stored data
                    EmptyView()
                }
                Divider()
                    .frame(height: 4)
                    .overlay(.gray)
                if loggedIn.profile.posts == 0 { // if they haven't posted anything, display nothing
                    EmptyView()
                } else { // else display their post
                    ScrollView{
                        LazyVStack {
                            ForEach(loggedIn.post, id: \.self) { post in
                                HStack {
                                    Image(post.avatar)
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 60, height: 60)
                                        .clipShape(Circle())
                                        .padding(.horizontal, 10)
                                    Text(post.userName)
                                        .font(.system(size: 20))
                                }
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding()
                                PostView(post: post)
                            }
                        }
                    }
                }
                Spacer()
            }
        }
    }
}

#Preview {
    UserProfile(loggedIn: .constant(User(username: "hac", password: "123", profile: Profile(userName: "hac", avatar: "hacavatar", following: 0, followers: 0, posts: 0), post: [Post(userName: "hac", avatar: "hacavatar", userImage: "", caption: "", hasImage: false)])), users: .constant([
        User(username: "amy", password: "123", profile: Profile(userName: "amy", avatar: "amyavatar", following: 10, followers: 20, posts: 1),
             post: [Post(userName: "amy", avatar: "amyavatar", userImage: "", caption: "I'm tired", hasImage: false)]),
        User(username: "hac", password: "123", profile: Profile(userName: "hac", avatar: "hacavatar", following: 0, followers: 0, posts: 0), post: [
            Post(userName: "hac", avatar: "hacavatar", userImage: "prettysunrise", caption: "Good morning everyone!", hasImage: true),
            Post(userName: "hac", avatar: "hacavatar", userImage: "meme", caption: "Good morning everyone!", hasImage: true)
        ]),
        User(username: "Daily Meme", password: "123", profile: Profile(userName: "Daily Meme", avatar: "healTheWorld", following: 0, followers: 100, posts: 5),
             post: [Post(userName: "Daily Meme", avatar: "healTheWorld", userImage: "meme", caption: "What is your 9 to 5 routine?", hasImage: true)])
    ]))
}
