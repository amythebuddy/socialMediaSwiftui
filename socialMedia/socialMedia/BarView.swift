//
//  BarView.swift
//  socialMedia
//
//  Created by Nguyen Huyen on 5/5/24.
//

import SwiftUI

struct BarView: View {
    @State var users : [User]
    var loggedIn: User
//    var profiles : [Profile]
    @State private var tabSelected: Int = 1
    var body: some View {
        NavigationView{
            TabView{
                VStack {
                    homePage(users: users)
                }
                    .tabItem {
                        Label("", systemImage: "house")
                }
                    .tag(1)
                
                AddPost(post: .constant([]), profile: Profile(userName: "hac", avatar: "hacavatar", following: 0, followers: 0, posts: 0))
                    .tabItem {
                        Label("", systemImage: "plus.square")
                        
                    }
                    .tag(2)
                VStack {
                    UserProfile(loggedIn: loggedIn, tabSelected: tabSelected)
                }
                    .tabItem {
                            Label("",systemImage: "person")
                    }
                    .tag(3)
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    BarView(users: [User(username: "hac", password: "123", profile: Profile(userName: "hac", avatar: "hacavatar", following: 0, followers: 0, posts: 0), post: [Post(userName: "hac", avatar: "hacavatar", userImage: "prettysunrise", caption: "", hasImage: false)])], loggedIn: User(username: "amy", password: "123", profile: Profile(userName: "amy", avatar: "", following: 0, followers: 0, posts: 0), post: [Post(userName: "amy", avatar: "", userImage: "", caption: "", hasImage: false)]))
}
