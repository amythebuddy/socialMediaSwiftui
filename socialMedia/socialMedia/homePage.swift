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
//    @State var posts: [Post] = [
//        Post(userName: "hac", avatar: "hacavatar", userImage: "prettysunrise", caption: "Good morning everyone!", hasImage: true),
//        Post(userName: "amy", avatar: "amyavatar", userImage: "", caption: "I'm tired", hasImage: false),
//        Post(userName: "Daily Meme", avatar: "healTheWorld", userImage: "meme", caption: "What is your 9 to 5 routine?", hasImage: true),
//        Post(userName: "hac", avatar: "hacavatar", userImage: "prettysunrise", caption: "Good morning everyone!", hasImage: true),
//        Post(userName: "hac", avatar: "hacavatar", userImage: "prettysunrise", caption: "Good morning everyone!", hasImage: true)
//    ]
//    var profiles: [Profile]
    var users: [User] // passing data to display the post
    var body: some View {
        NavigationView{
            ScrollView{
                LazyVStack {
                    ForEach(users.indices, id: \.self) { i in
                        ForEach(users[i].post.indices, id: \.self) { j in //show each user avatar and username
                            VStack{
                                Button(action: {
                                    searchProfile(username: users[i].post[j].userName)
                                }, label: {
                                    Image(users[i].post[j].avatar)
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 60, height: 60)
                                        .clipShape(Circle())
                                        .padding(.horizontal, 10)
                                    Text(users[i].post[j].userName)
                                        .font(.system(size: 20))
                                })
                                .frame(maxWidth: .infinity, alignment: .leading)
                                
                                NavigationLink(destination: AccountPage(profile: account), isActive: $showView){
                                    EmptyView()
                                }
                                PostView(post: users[i].post[j]) // showing the post about, image and caption
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
    func searchProfile(username: String){
        for user in users{
            if user.profile.userName == username { // search the profile of the person who add post
                account = user.profile // change the account so the AccountPage receive the person who add post
                showView = true
            }
        }
    }
}

#Preview {
    homePage(users: [User(username: "hac", password: "123", profile: Profile(userName: "hac", avatar: "hacavatar", following: 0, followers: 0, posts: 0), post: [Post(userName: "hac", avatar: "hacavatar", userImage: "prettysunrise", caption: "Good morning everyone!", hasImage: true)])])
}
