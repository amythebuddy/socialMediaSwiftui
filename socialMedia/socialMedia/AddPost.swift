//
//  AddPost.swift
//  socialMedia
//
//  Created by StudentAM on 5/7/24.
//

import SwiftUI

struct AddPost: View {
    @Binding var loggedIn: User
    @Binding var users: [User]
    @State var content = ""
    @State private var isPublished = false // alert the user that they have posted
    @State private var isEmpty = false
    var body: some View {
        NavigationView{
            VStack{
                HStack {
                    Image(loggedIn.profile.avatar)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 70, height: 70)
                        .clipShape(Circle())
                        .padding(.horizontal, 10)
                    
                    Text(loggedIn.profile.userName)
                        .font(.system(size: 20))
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                TextEditor(text: $content) //TextEditor will grab the content that user put
                    .frame(maxWidth: 370, maxHeight: 500)
                    .padding()
                    .font(.system(size: 30))
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(10)
                Button(action: {
                    publishPost()
                }, label: {
                    Text("Publish")
                        .foregroundColor(.white)
                        .font(.custom("BebasNeue-Regular", size: 40))
                        .frame(maxWidth: 200, maxHeight: 50)
                        .background(Color.purple)
                        .cornerRadius(50)
                })
                .alert(isPresented: $isEmpty){ //alert if the user doesn't input anything
                    Alert(
                        title: Text("You did not type something"),
                        message: Text("Please type to post")
                    )
                }
                .alert(isPresented: $isPublished){ //tell the user that they have posted
                    Alert(
                        title: Text("You successfully published a post!")
                    )
                }
            }
        }
    }
    func publishPost(){
        if content.isEmpty {
            isEmpty = true
        } else {
            //create new post
            let newPost = Post(userName: loggedIn.profile.userName, avatar: loggedIn.profile.avatar, userImage: "", amountOfLikes: 0, caption: content, hasImage: false)
            loggedIn.post.append(newPost) // append it to userProfile post so they can see it in their profile
            loggedIn.profile.posts += 1 // add 1 post to their profile
            for i in users.indices { // for each user in array of users
                if users[i].username == loggedIn.username{ // if spotted the loggedIn user
                    users[i].post.append(newPost) // append it to the post array so it appears on the feed with other people's posts
                }
            }
            content = "" // reset content
            isPublished = true
        }
    }
}

#Preview {
    AddPost(loggedIn: .constant(User(username: "hac", password: "123", profile: Profile(userName: "hac", avatar: "hacavatar", following: 0, followers: 0, posts: 0), post: [Post(userName: "hac", avatar: "hacavatar", userImage: "", amountOfLikes: 5, caption: "", hasImage: false)])), users: .constant([]))
}
