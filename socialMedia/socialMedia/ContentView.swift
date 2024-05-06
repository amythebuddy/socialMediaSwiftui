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
}
struct ContentView: View {
    @State var users: [User] = [
    User(username: "hac", password: "123")
    ]
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
                    NavigationLink(destination: BarView(), isActive: $showView){
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
            alert = false
            for user in users{
                if user.username == name && user.password == pass {
                    noUser = false
                    showView = true
                } else {
                    noUser = true
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
