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
    @State private var alert = false
    @State private var showView = false
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
                TextField("\(Image(systemName: "person")) Username", text: $name)
                    .padding()
                    .frame(maxWidth: 370, maxHeight: 53)
                    .background(Color.white)
                    .font(.system(size: 20))
                    .cornerRadius(60)
                    .padding()
                    .autocapitalization(.none)
                TextField("\(Image(systemName: "lock.shield")) Password", text: $pass)
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
                NavigationLink(destination: ContentView(), isActive: $showView){
                    EmptyView()
                }
            }
        }
    }
    func createUser() {
        if name.isEmpty && pass.isEmpty {
            alert = true
        } else {
            showView = true
            alert = false
            let newUser = User(username: name, password: pass) // create new user
            print(newUser)
            users.append(newUser) // append newUser to the users array
            print(users)
        }
    }
}

#Preview {
    loginPage(users: .constant([]))
}
