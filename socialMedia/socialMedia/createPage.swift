//
//  loginPage.swift
//  socialMedia
//
//  Created by StudentAM on 4/29/24.
//

import SwiftUI

struct loginPage: View {
    @State var username = ""
    @State var password = ""
    @State var email = ""
    @State private var alert = false
    @Binding var users : [User]
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
                TextField("\(Image(systemName: "person")) Username", text: $username)
                    .padding()
                    .frame(maxWidth: 370, maxHeight: 53)
                    .background(Color.white)
                    .font(.system(size: 20))
                    .cornerRadius(60)
                    .padding()
                SecureField("\(Image(systemName: "lock.shield")) Password", text: $password)
                    .padding()
                    .font(.system(size: 20))
                    .background(Color.white)
                    .frame(maxWidth: 370, maxHeight: 53)
                    .cornerRadius(60)
                    .padding()
                TextField("\(Image(systemName: "mail.and.text.magnifyingglass")) Email Address", text: $email)
                    .padding()
                    .frame(maxWidth: 370, maxHeight: 53)
                    .background(Color.white)
                    .font(.system(size: 20))
                    .cornerRadius(60)
                    .padding()
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
        if username.isEmpty && password.isEmpty && email.isEmpty {
            alert = true
        } else {
            alert = false
            let newUser = User(username: username, password: password, email: email) // create new user
            users.append(newUser) // append newUser to the users array
        }
    }
}

#Preview {
    loginPage(users: .constant([]))
}
