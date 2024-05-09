//
//  BarView.swift
//  socialMedia
//
//  Created by Nguyen Huyen on 5/5/24.
//

import SwiftUI

struct BarView: View {
    var profiles : [Profile]
    var body: some View {
        NavigationView{
            TabView{
                VStack {
                    homePage(profiles: profiles) 
                }
                    .tabItem {
                        Label("", systemImage: "house")
                }
                
                AddPost(post: .constant([]), profile: Profile(userName: "hac", avatar: "hacavatar", following: 0, followers: 0, posts: 0))
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
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    BarView(profiles: [Profile(userName: "hac", avatar: "hacavatar", following: 0, followers: 0, posts: 0)])
}
