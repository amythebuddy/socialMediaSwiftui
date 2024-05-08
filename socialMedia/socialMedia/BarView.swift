//
//  BarView.swift
//  socialMedia
//
//  Created by Nguyen Huyen on 5/5/24.
//

import SwiftUI

struct BarView: View {
    var body: some View {
        NavigationView{
            TabView{
                VStack {
                    homePage()
                }
                    .tabItem {
                        Label("", systemImage: "house")
                }
                
                AddPost(post: Post(userName: "hac", avatar: "hacavatar", userImage: "prettysunrise", caption: "Good morning", hasImage: true))
                    .tabItem {
                        Label("", systemImage: "plus.square")
                    }
                VStack {
                    AccountPage(profile: Profile(userName: "", avatar: "", following: 0, followers: 0, posts: 0))
                }
                        .tabItem {
                            Label("",systemImage: "person")
                    }
            }
            .navigationBarBackButtonHidden(true)
        }
    }
}

#Preview {
    BarView()
}
