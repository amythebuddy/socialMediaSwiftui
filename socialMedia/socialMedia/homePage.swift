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
    @State var posts: [Post] = [
    Post(userName: "hac", avatar: "hacavatar", userImage: "prettysunrise", caption: "Good morning everyone!", hasImage: true),
    Post(userName: "amy", avatar: "amyavatar", userImage: "", caption: "I'm tired", hasImage: false),
    Post(userName: "Daily Meme", avatar: "healTheWorld", userImage: "meme", caption: "What is your 9 to 5 routine?", hasImage: true),
    Post(userName: "hac", avatar: "hacavatar", userImage: "prettysunrise", caption: "Good morning everyone!", hasImage: true),
    ]
    @State var profiles: [Profile] = [
    Profile(userName: "hac", avatar: "hacavatar", following: 90, followers: 10, posts: 2),
    Profile(userName: "amy", avatar: "amyavatar", following: 10, followers: 20, posts: 1),
    Profile(userName: "Daily Meme", avatar: "healTheWorld", following: 0, followers: 100, posts: 5),
   
    Profile(userName: "hac", avatar: "hacavatar", following: 90, followers: 10, posts: 2),
    ]
    var body: some View {
        NavigationView{
            ScrollView{
                LazyVStack {
                    ForEach(profiles.indices, id: \.self) { i in
                        if profiles[i].userName == posts[i].userName {
                            NavigationLink(destination: AccountPage(profile: profiles[i])){
                                HStack {
                                    Image(posts[i].avatar)
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 60, height: 60)
                                        .clipShape(Circle())
                                        .padding(.horizontal, 10)
                                    Text(posts[i].userName)
                                        .font(.system(size: 20))
                                }
                            }
//                            .padding(.vertical, -50)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            PostView(post: posts[i])
                            Spacer()
                        }
                    }
                    
                }
            }
        }
        .navigationBarBackButtonHidden(true)
        Spacer()
    }
}

#Preview {
    homePage()
}
