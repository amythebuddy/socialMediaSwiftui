//
//  BarView.swift
//  socialMedia
//
//  Created by Nguyen Huyen on 5/5/24.
//

import SwiftUI

struct BarView: View {
    @Binding var users : [User] // pass all the users
    @Binding var loggedIn: User // pass the person who logs in
    var body: some View {
        NavigationView{
            TabView{
                VStack {
                    homePage(users: $users, loggedIn: $loggedIn)
                }
                    .tabItem {
                        Label("", systemImage: "house")
                }
                
                AddPost(loggedIn: $loggedIn, users: $users)
                    .tabItem {
                        Label("", systemImage: "plus.square")
                        
                    }
                VStack {
                    UserProfile(loggedIn: $loggedIn, users: $users)
                }
                    .tabItem {
                            Label("",systemImage: "person")
                    }
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    BarView(users: .constant([User(username: "hac", password: "123", profile: Profile(userName: "hac", avatar: "hacavatar", following: 0, followers: 0, posts: 0), post: [Post(userName: "hac", avatar: "hacavatar", userImage: "prettysunrise", amountOfLikes: 0, caption: "", hasImage: false)])]), loggedIn:.constant(User(username: "amy", password: "123", profile: Profile(userName: "amy", avatar: "", following: 0, followers: 0, posts: 0), post: [Post(userName: "amy", avatar: "", userImage: "", amountOfLikes: 10, caption: "", hasImage: false)])))
}
