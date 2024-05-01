//
//  homePage.swift
//  socialMedia
//
//  Created by StudentAM on 4/29/24.
//

import SwiftUI

struct Post {
    var content : String
    
}

struct homePage: View {
    @State var like = false
    @State var amountOfLikes = 0
    var body: some View {
        VStack{
            HStack {
                Circle()
                    .frame(width: 60, height: 60)
                    .padding()
                Text("hac")
                    .font(.system(size: 20))
                    .padding(.horizontal, -10)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            Text("Good morning everyone! Hope you guys are having a nice day so far!")
                .padding()
                .frame(maxWidth: 370, maxHeight: 150)
                .background(Color.gray.opacity(0.3))
                .font(.system(size: 24))
                .cornerRadius(60)
            HStack{
                Button {
                    like.toggle()
                    
                } label: {
                    Image(systemName: like ? "heart.fill" : "heart")
                        .font(.system(size: 30))
                }
                Button {
                    
                } label: {
                    Image(systemName: "message")
                        .font(.system(size: 30))
                }
            }
        }
        
        Spacer()
    }
}

#Preview {
    homePage()
}
