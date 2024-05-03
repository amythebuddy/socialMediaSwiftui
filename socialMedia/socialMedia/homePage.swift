//
//  homePage.swift
//  socialMedia
//
//  Created by StudentAM on 4/29/24.
//

import SwiftUI

struct Post {
    var userName: String
    var userImage: String
    var caption : String
    var hasImage : Bool
}

struct homePage: View {
    @State var posts: [Post] = [
    Post(userName: "hac", userImage: "prettysunrise", caption: "Good morning everyone!", hasImage: true)
    ]
    var body: some View {
        ScrollView{
            LazyVStack {
                ForEach(posts.indices, id: \.self) { i in
                    PostView(post: posts[i])
                }
            }
        }

        Spacer()
    }
}

#Preview {
    homePage()
}
