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
    var email: String
}
struct ContentView: View {
    @State private var users: [User] = [
    User(username: "hac", password: "123", email: "hac@gmail.com")
    ]
    @State var username = ""
    @State var password = ""
    @State var showView = false
    var body: some View {
        NavigationView {
            ZStack {
                Image("blue")
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
                    .padding(.top, 80)
                    NavigationLink(destination: homePage(), isActive: $showView){
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
    }
}

#Preview {
    ContentView()
}
