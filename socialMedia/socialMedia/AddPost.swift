//
//  AddPost.swift
//  socialMedia
//
//  Created by StudentAM on 5/7/24.
//

import SwiftUI

struct AddPost: View {
    @Binding var post : [Post]
    @State var profile: Profile
    @State var content = ""
    @Environment(\.presentationMode) var presentationMode //@Environment allows you to control the presentation mode of the current view
    var body: some View {
        NavigationView{
            VStack{
                HStack {
                    Image(profile.avatar)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 70, height: 70)
                        .clipShape(Circle())
                        .padding(.horizontal, 10)
                    
                    Text(profile.userName)
                        .font(.system(size: 20))
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                TextField("What is on your mind?", text: $content)
                    .frame(maxWidth: 370, maxHeight: 500)
                    .padding()
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(10) //TextEditor will grab the content that user put
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
            }
        }
    }
    func publishPost(){
        let newPost = Post(userName: profile.userName, avatar: profile.avatar, userImage: "", caption: content, hasImage: false)
        post.append(newPost)
        presentationMode.wrappedValue.dismiss() //dismisses the current view
    }
}

#Preview {
    AddPost(post: .constant([]), profile: Profile(userName: "hac", avatar: "hacavatar", following: 0, followers: 0, posts: 0))
}
