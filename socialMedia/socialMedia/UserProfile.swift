//
//  UserProfile.swift
//  socialMedia
//
//  Created by StudentAM on 5/10/24.
//

import SwiftUI

struct UserProfile: View {
    var loggedIn: User
    var tabSelected: Int
    var body: some View {
        VStack{
            HStack{
                VStack {
                    if tabSelected == 3{
                        Image(loggedIn.profile.avatar)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 70, height: 70)
                            .clipShape(Circle())
                            .padding(.horizontal, 10)
                        Text(loggedIn.username)
                            .font(.system(size: 20))
                    }
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
            Divider()
                .frame(height: 4)
                .overlay(.gray)
        }
        Spacer()
    }
}

#Preview {
    UserProfile(loggedIn: User(username: "hac", password: "123", profile: Profile(userName: "hac", avatar: "hacavatar", following: 0, followers: 0, posts: 0), post: [Post(userName: "hac", avatar: "", userImage: "", caption: "", hasImage: false)]), tabSelected: 3)
}
