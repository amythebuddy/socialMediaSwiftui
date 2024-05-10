//
//  UserProfile.swift
//  socialMedia
//
//  Created by StudentAM on 5/10/24.
//

import SwiftUI

struct UserProfile: View {
    var loggedIn: [User]
    var tabSelected: Int
    var profile: [Profile]
    var body: some View {
//        ForEach(profile.indices, id: \.self) { i in
//            if tabSelected == 3 && loggedIn[i].username == profile[i].userName{
//                Image(loggedIn[i].username)
//                    .resizable()
//                    .scaledToFit()
//                    .frame(width: 70, height: 70)
//                    .clipShape(Circle())
//                    .padding(.horizontal, 10)
//                Text(loggedIn[i].userName)
//                    .font(.system(size: 20))
//            } else {
//                
//                Text("hello")
//            }
//        }
        Text("hello")
    }
}

#Preview {
    UserProfile(loggedIn: [User(username: "hac", password: "123")], tabSelected: 3,
                profile: [Profile(userName: "hac", avatar: "hacavatar", following: 0, followers: 0, posts: 0)])
}
