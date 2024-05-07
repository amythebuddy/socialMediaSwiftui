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
    Post(userName: "Daily Meme", avatar: "healTheWorld", userImage: "meme", caption: "What is your 9 to 5 routine?", hasImage: true)
    ]
    var body: some View {
        NavigationView{
            ScrollView{
                LazyVStack {
                    ForEach(posts.indices, id: \.self) { i in
                        PostView(post: posts[i])
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
