//
//  BarView.swift
//  socialMedia
//
//  Created by Nguyen Huyen on 5/5/24.
//

import SwiftUI

struct BarView: View {
    @State var user : [User]
//    var profiles : [Profile]
    @State private var tabSelected: Int = 1
    var body: some View {
        NavigationView{
            TabView{
                VStack {
                    homePage(user: user)
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
                    UserProfile(loggedIn: user, tabSelected: tabSelected, profile: profiles)
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
    BarView(user: [User(username: "hac", password: "123")], profiles: [Profile(userName: "hac", avatar: "hacavatar", following: 0, followers: 0, posts: 0)])
}
