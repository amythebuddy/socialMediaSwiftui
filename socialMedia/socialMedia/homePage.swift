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
    var body: some View {
        VStack{
            HStack {
                Circle()
                    .frame(width: 70, height: 70)
                    .padding()
                Text("hac")
                    .font(.system(size: 20))
                    .padding(.horizontal, -10)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            Text("Good morning everyone! Hope you guys are having a nice day so far!")
                .padding()
                .frame(maxWidth: 370, maxHeight: 100)
                .background(Color.gray.opacity(0.3))
                .font(.system(size: 20))
                .cornerRadius(60)
            HStack{
                Text("\(Image(systemName: "heart"))")
            }
        }
        
        Spacer()
    }
}

#Preview {
    homePage()
}
