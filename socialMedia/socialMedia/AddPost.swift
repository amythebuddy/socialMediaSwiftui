//
//  AddPost.swift
//  socialMedia
//
//  Created by StudentAM on 5/7/24.
//

import SwiftUI

struct AddPost: View {
    @State var content = ""
    var body: some View {
        NavigationView{
            TextEditor(text: $content) //TextEditor will grab the content that user put
            .padding()
            .background(Color.gray.opacity(0.1))
            .cornerRadius(8)
        }
    }
}

#Preview {
    AddPost()
}
