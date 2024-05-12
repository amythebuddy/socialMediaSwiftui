//
//  loginPage.swift
//  socialMedia
//
//  Created by StudentAM on 4/29/24.
//

import SwiftUI

struct loginPage: View {
    @State var name = ""
    @State var pass = ""
    @State private var alert = false // for empty input
    @Binding var users : [User]
    @Environment(\.presentationMode) var presentationMode //@Environment allows you to control the presentation mode of the current view
    var body: some View {
        ZStack{
            Image("blue")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .edgesIgnoringSafeArea(.all)
            VStack{
                Text("Create Account")
                    .font(.custom("MadimiOne-Regular", size: 50))
                    .padding(.top, 90)
                TextField("\(Image(systemName: "person")) Username", text: $name)
                    .padding()
                    .frame(maxWidth: 370, maxHeight: 53)
                    .background(Color.white)
                    .font(.system(size: 20))
                    .cornerRadius(60)
                    .padding()
                    .autocapitalization(.none)
                SecureField("\(Image(systemName: "lock.shield")) Password", text: $pass)
                    .padding()
                    .font(.system(size: 20))
                    .background(Color.white)
                    .frame(maxWidth: 370, maxHeight: 53)
                    .cornerRadius(60)
                    .padding()
                    .autocapitalization(.none)
                Button(action: {
                    createUser()
                }, label: {
                    Text("Create")
                        .foregroundColor(.white)
                        .font(.custom("BebasNeue-Regular", size: 40))
                        .frame(maxWidth: 200, maxHeight: 50)
                        .background(Color.purple)
                        .cornerRadius(50)
                })
                .alert(isPresented: $alert){ //alert if the user doesn't input anything
                    Alert(
                        title: Text("You did not type something"),
                        message: Text("Please type in to create an account")
                    )
                }
                .padding(.top, 80)
            }
        }
    }
    func createUser() {
        if name.isEmpty && pass.isEmpty {
            alert = true //to alert the user that input has nothing
        } else {
            alert = false
            let newUser = User(username: name, password: pass, profile: Profile(userName: name, avatar: "", following: 0, followers: 0, posts: 0), post: [Post(userName: name, avatar: "", userImage: "", caption: "", hasImage: false)]) // create new user
            users.append(newUser) // append newUser to the users array
            presentationMode.wrappedValue.dismiss() //dismisses the current view
        }
    }
}

#Preview {
    loginPage(users: .constant([]))
}
