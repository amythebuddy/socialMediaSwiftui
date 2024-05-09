//
//  homePage.swift
//  socialMedia
//
//  Created by StudentAM on 4/29/24.
//

import SwiftUI

struct Post : Hashable{
    var userName: String
    var avatar: String
    var userImage: String
    var caption : String
    var hasImage : Bool
}

struct homePage: View {
    @State var showView = false
    @State var account: Profile = Profile(userName: "", avatar: "", following: 0, followers: 0, posts: 0)
    @State var posts: [Post] = [
        Post(userName: "hac", avatar: "hacavatar", userImage: "prettysunrise", caption: "Good morning everyone!", hasImage: true),
        Post(userName: "amy", avatar: "amyavatar", userImage: "", caption: "I'm tired", hasImage: false),
        Post(userName: "Daily Meme", avatar: "healTheWorld", userImage: "meme", caption: "What is your 9 to 5 routine?", hasImage: true),
        Post(userName: "hac", avatar: "hacavatar", userImage: "prettysunrise", caption: "Good morning everyone!", hasImage: true),
        Post(userName: "hac", avatar: "hacavatar", userImage: "prettysunrise", caption: "Good morning everyone!", hasImage: true)
    ]
    var profiles: [Profile]
    var body: some View {
        NavigationView{
            ScrollView{
                LazyVStack {
                    
                    ForEach(posts.indices, id: \.self) { i in
                        Button(action: {
                            searchProfile(username: posts[i].userName)
                        }, label: {
                            Image(posts[i].avatar)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 60, height: 60)
                                .clipShape(Circle())
                                .padding(.horizontal, 10)
                            Text(posts[i].userName)
                                .font(.system(size: 20))
                            
                        })
                        //                            .padding(.vertical, -50)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        NavigationLink(destination: AccountPage(profile: account), isActive: $showView){
                            EmptyView()
                        }
                        PostView(post: posts[i])
                        Spacer()
                    }
                    
                }
            }
            .navigationBarBackButtonHidden(true)
            Spacer()
        }
    }
    func searchProfile(username: String){
        for profile in profiles {
            if profile.userName == username {
                account = profile
                showView = true
            }
        }
    }
}

#Preview {
    homePage(profiles: [Profile(userName: "hac", avatar: "hacavatar", following: 0, followers: 0, posts: 0)])
}
