//
//  EditUserProfile.swift
//  socialMedia
//
//  Created by Nguyen Huyen on 5/12/24.
//

import SwiftUI

struct EditUserProfile: View {
    @Binding var loggedIn: User
    @Binding var users: [User]
    @State private var newName = ""
    @State private var newPassword = ""
    @State private var showView = false
    @State private var isEmpty = false // check if the textfield is empty
    @State private var isSameName = false // checking if there is already a user with the same username
    var body: some View {
        NavigationView{
            VStack {
                Image(loggedIn.profile.avatar)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 70, height: 70)
                    .clipShape(Circle())
                    .padding(.horizontal, 10)
                
                Text(loggedIn.profile.userName)
                    .font(.system(size: 20))
                TextField("\(Image(systemName: "person")) New Username", text: $newName) //asking new username
                    .padding()
                    .frame(maxWidth: 370, maxHeight: 53)
                    .background(Color.gray.opacity(0.2))
                    .font(.system(size: 20))
                    .cornerRadius(60)
                    .padding()
                    .autocapitalization(.none)
                TextField("\(Image(systemName: "lock.shield")) New Password", text: $newPassword) //asking new password
                    .padding()
                    .frame(maxWidth: 370, maxHeight: 53)
                    .background(Color.gray.opacity(0.2))
                    .font(.system(size: 20))
                    .cornerRadius(60)
                    .padding()
                    .autocapitalization(.none)
                Button(action: {
                    changeProfile()
                }, label: {
                    Text("Done")
                        .foregroundColor(.white)
                        .font(.custom("BebasNeue-Regular", size: 40))
                        .frame(maxWidth: 200, maxHeight: 50)
                        .background(Color.purple)
                        .cornerRadius(50)
                        .padding()
                })
                .alert(isPresented: $isEmpty){ //alert if the user doesn't input anything
                    Alert(
                        title: Text("You did not type something"),
                        message: Text("Please type in to change your username/password")
                    )
                }
                .alert(isPresented: $isSameName){ //alert if the user inputs the same username
                    Alert(
                        title: Text("Your new username is taken."),
                        message: Text("Please create another username.")
                    )
                }
                NavigationLink(destination: UserProfile(loggedIn: $loggedIn, users: $users), isActive: $showView){ // go to another page with stored data
                    EmptyView()
                }
                Spacer()
            }
        }
    }
    func changeProfile(){
        if newName.isEmpty && newPassword.isEmpty { // if both of the textfield is empty
            isEmpty = true
        }
        for i in users.indices{
            if users[i].username == newName { // if the new username is taken
                isSameName = true // flag to track if there is a same name
            } else {
                if users[i].username == loggedIn.username{ // if username is the same as the person who logs in
                    for j in users[i].post.indices{ // for each post in the array of post
                        // this is for the homePage where everyone's post display
                        users[i].post[j].userName = newName // change the username of each post to new username
                    }
                }
                loggedIn.username = newName // change username of person who logs in
                loggedIn.profile.userName = newName // change the username in the profile struct
                for i in loggedIn.post.indices { // for each post in the person who logs in
                    // this is for the userProfile where only the post of the person who logs in display
                    loggedIn.post[i].userName = newName // change the username of each post to new username
                }
            }
        }
        newName = "" // reset the username textfield
        loggedIn.password = newPassword // change to new password
        newPassword = "" // reset the password textfield
    }
}

#Preview {
    EditUserProfile(loggedIn: .constant(User(username: "hac", password: "123", profile: Profile(userName: "hac", avatar: "hacavatar", following: 0, followers: 0, posts: 0), post: [Post(userName: "hac", avatar: "hacavatar", userImage: "", amountOfLikes: 0, caption: "", hasImage: false)])), users: .constant([
        User(username: "amy", password: "123", profile: Profile(userName: "amy", avatar: "amyavatar", following: 10, followers: 20, posts: 1),
             post: [Post(userName: "amy", avatar: "amyavatar", userImage: "", amountOfLikes: 10, caption: "I'm tired", hasImage: false)]),
        User(username: "hac", password: "123", profile: Profile(userName: "hac", avatar: "hacavatar", following: 0, followers: 0, posts: 0), post: [
            Post(userName: "hac", avatar: "hacavatar", userImage: "prettysunrise", amountOfLikes: 5, caption: "Good morning everyone!", hasImage: true),
            Post(userName: "hac", avatar: "hacavatar", userImage: "meme", amountOfLikes: 0, caption: "Good morning everyone!", hasImage: true)
        ]),
        User(username: "Daily Meme", password: "123", profile: Profile(userName: "Daily Meme", avatar: "healTheWorld", following: 0, followers: 100, posts: 5),
             post: [Post(userName: "Daily Meme", avatar: "healTheWorld", userImage: "meme", amountOfLikes: 100, caption: "What is your 9 to 5 routine?", hasImage: true)])
    ]))
}
