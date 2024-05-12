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
    @State private var isMyself = false
    @State var account: User = User(username: "", password: "", profile: Profile(userName: "", avatar: "", following: 0, followers: 0, posts: 0), post: [Post(userName: "", avatar: "", userImage: "", caption: "", hasImage: false)])
    var users: [User] // passing data to display the post
    @Binding var loggedIn: User
    var body: some View {
        NavigationView{
            ScrollView{
                LazyVStack {
                    ForEach(users, id: \.self) { user in // for each user in users array
                        ForEach(user.post, id: \.self) { post in // for each post
                            //show each user avatar and username
                            VStack{
                                Button(action: {
                                    searchProfile(username: post.userName)
                                }, label: {
                                    Image(post.avatar)
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 60, height: 60)
                                        .clipShape(Circle())
                                        .padding(.horizontal, 10)
                                    Text(post.userName)
                                        .font(.system(size: 25))
                                })
                                .frame(maxWidth: .infinity, alignment: .leading)
                                
                                NavigationLink(destination: AccountPage(user: $account, loggedIn: $loggedIn), isActive: $showView){
                                    EmptyView()
                                }
                                .disabled(isMyself)
                                PostView(post: post) // showing the post about, image and caption
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
            if loggedIn.username == username {
                isMyself = true
            } else if user.profile.userName == username { // search the profile of the person who add post
                account = user // change the account so the AccountPage receive the person who add post
                showView = true
            }
        }
    }
}

#Preview {
    homePage(users: [
        User(username: "amy", password: "123", profile: Profile(userName: "amy", avatar: "amyavatar", following: 10, followers: 20, posts: 1),
             post: [Post(userName: "amy", avatar: "amyavatar", userImage: "", caption: "I'm tired", hasImage: false)]),
        User(username: "hac", password: "123", profile: Profile(userName: "hac", avatar: "hacavatar", following: 0, followers: 0, posts: 0), post: [
            Post(userName: "hac", avatar: "hacavatar", userImage: "prettysunrise", caption: "Good morning everyone!", hasImage: true), 
            Post(userName: "hac", avatar: "hacavatar", userImage: "prettysunrise", caption: "Good morning everyone!", hasImage: true)
        ]),
        User(username: "Daily Meme", password: "123", profile: Profile(userName: "Daily Meme", avatar: "healTheWorld", following: 0, followers: 100, posts: 5),
             post: [Post(userName: "Daily Meme", avatar: "healTheWorld", userImage: "meme", caption: "What is your 9 to 5 routine?", hasImage: true)])
    ], loggedIn: .constant(User(username: "hac", password: "123", profile: Profile(userName: "hac", avatar: "hacavatar", following: 0, followers: 0, posts: 0), post: [Post(userName: "hac", avatar: "hacavatar", userImage: "", caption: "", hasImage: false)])))
}
