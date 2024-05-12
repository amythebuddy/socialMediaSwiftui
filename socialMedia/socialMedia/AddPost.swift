//
//  AddPost.swift
//  socialMedia
//
//  Created by StudentAM on 5/7/24.
//

import SwiftUI

struct AddPost: View {
    @Binding var loggedIn: User
    @State var content = "What is on your mind?"
    @State private var isPublished = false
    @State private var isEmpty = false
    @Environment(\.presentationMode) var presentationMode //@Environment allows you to control the presentation mode of the current view
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
                    .foregroundStyle(content == "What is on your mind?" ? .gray : .primary)
                    .onTapGesture {
                        content = ""
                    }
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
                .alert(isPresented: $isPublished){ //alert if the user doesn't input anything
                    Alert(
                        title: Text("You successfully published a post!")
                    )
                }
                .alert(isPresented: $isEmpty){ //alert if the user doesn't input anything
                    Alert(
                        title: Text("You did not type something"),
                        message: Text("Please type to post")
                    )
                }
            }
        }
    }
    func publishPost(){
        if content.isEmpty {
            isEmpty = true
        } else {
            isPublished = true
            let newPost = Post(userName: loggedIn.profile.userName, avatar: loggedIn.profile.avatar, userImage: "", caption: content, hasImage: false)
            loggedIn.post.append(newPost)
            loggedIn.profile.posts += 1
            content = ""
        }
    }
}

#Preview {
    AddPost(loggedIn: .constant(User(username: "hac", password: "123", profile: Profile(userName: "hac", avatar: "hacavatar", following: 0, followers: 0, posts: 0), post: [Post(userName: "hac", avatar: "hacavatar", userImage: "", caption: "", hasImage: false)])))
}
