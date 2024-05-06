//
//  BarView.swift
//  socialMedia
//
//  Created by Nguyen Huyen on 5/5/24.
//

import SwiftUI

struct BarView: View {
    var body: some View {
        NavigationView{
            TabView{
                VStack {
                    homePage()
                }
                    .tabItem {
                        Label("", systemImage: "house")
                }
                
                
//                AccountPage()
//                    .tabItem {
//                        Label("",systemImage: "person")
//                    }
            }
            .navigationBarBackButtonHidden(true)
        }
    }
}

#Preview {
    BarView()
}
