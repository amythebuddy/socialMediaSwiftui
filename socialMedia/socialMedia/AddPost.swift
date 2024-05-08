//
//  AddPost.swift
//  socialMedia
//
//  Created by StudentAM on 5/7/24.
//

import SwiftUI

struct AddPost: View {
    var post : Post
    @State var content = ""
    var body: some View {
        NavigationView{
            VStack{
                
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
        
    }
}

#Preview {
    AddPost(post: Post(userName: "hac", avatar: "hacavatar", userImage: "prettysunrise", caption: "Good morning", hasImage: true))
}
