//
//  ContentView.swift
//  socialMedia
//
//  Created by StudentAM on 4/23/24.
//

import SwiftUI

struct User : Hashable {
    var username: String
    var password: String
    var profile: Profile
    var post: [Post]
}
struct ContentView: View {
    @State var users: [User] = [ // dummy data
        User(username: "amy", password: "123", profile: Profile(userName: "amy", avatar: "amyavatar", following: 10, followers: 20, posts: 1),
             post: [Post(userName: "amy", avatar: "amyavatar", userImage: "", caption: "I'm tired", hasImage: false)]),
        User(username: "hac", password: "123", profile: Profile(userName: "hac", avatar: "hacavatar", following: 90, followers: 10, posts: 2),
             post: [Post(userName: "hac", avatar: "hacavatar", userImage: "prettysunrise", caption: "Good morning everyone!", hasImage: true),
                    Post(userName: "hac", avatar: "hacavatar", userImage: "meme", caption: "hello", hasImage: true)]),
        User(username: "Daily Meme", password: "123", profile: Profile(userName: "Daily Meme", avatar: "healTheWorld", following: 0, followers: 100, posts: 5),
             post: [Post(userName: "Daily Meme", avatar: "healTheWorld", userImage: "meme", caption: "What is your 9 to 5 routine?", hasImage: true)])
    ]
    @State var loggedIn: User = User(username: "", password: "", profile: Profile(userName: "", avatar: "", following: 0, followers: 0, posts: 0), post: [Post(userName: "", avatar: "", userImage: "", caption: "", hasImage: false)])
    @State var name = ""
    @State var pass = ""
    @State var showView = false
    @State private var alert = false
    @State private var noUser = false
    var body: some View {
        NavigationView {
            ZStack {
                Image("blue") //background
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .edgesIgnoringSafeArea(.all)
                VStack {
                    Text("Hello!")
                        .font(.custom("MadimiOne-Regular", size: 80))
                        .padding(.top, 90)
                    Text("Sign in to your account")
                        .font(.custom("MadimiOne-Regular", size: 30))
                        .padding(.bottom, 80)
                    TextField("\(Image(systemName: "person")) Username", text: $name) //asking username
                        .padding()
                        .frame(maxWidth: 370, maxHeight: 53)
                        .background(Color.white)
                        .font(.system(size: 20))
                        .cornerRadius(60)
                        .padding()
                        .autocapitalization(.none)
                    SecureField("\(Image(systemName: "lock.shield")) Password", text: $pass) //asking password
                        .padding()
                        .font(.system(size: 20))
                        .background(Color.white)
                        .frame(maxWidth: 370, maxHeight: 53)
                        .cornerRadius(60)
                        .padding()
                        .autocapitalization(.none)
                    
                    Button(action: {
                        checkUser()
                    }, label: {
                        Text("Login")
                        .foregroundColor(.white)
                        .font(.custom("BebasNeue-Regular", size: 40))
                        .frame(maxWidth: 200, maxHeight: 50)
                        .background(Color.purple)
                        .cornerRadius(50)
                        
                    })
                    .alert(isPresented: $alert){ //alert if the user doesn't input anything
                        Alert(
                            title: Text("You did not type something"),
                            message: Text("Please type to login")
                        )
                    }
                    .alert(isPresented: $noUser){ //alert if the user input wrong
                        Alert(
                            title: Text("Your username/password is wrong"),
                            message: Text("Please type again")
                        )
                    }
                    .padding(.top, 80)
                    NavigationLink(destination: BarView(users: $users, loggedIn: $loggedIn), isActive: $showView){ // go to another page with stored data
                        EmptyView()
                    }
                    Spacer()
                    HStack{
                        Text("Don't have an account?")
                            .font(.custom("MadimiOne-Regular", size: 25))
                        NavigationLink(destination: loginPage(users: $users), label: {
                            Text("Create")
                                .font(.custom("BebasNeue-Regular", size: 30))
                                .foregroundColor(.black)
                                .fontWeight(.bold)
                                .underline()
                        })
                    }
                }
            }
        }
    }
    func checkUser(){
        if name.isEmpty && pass.isEmpty {
            alert = true
        } else {
            var foundUser = false
            for user in users{
                if user.username == name && user.password == pass {
                    noUser = false
                    loggedIn = user // to keep track who is the user that is logging in
                    showView = true
                    foundUser = true
                }
            }
            if !foundUser {
                noUser = true
            }
        }
    }
}

#Preview {
    ContentView()
}
