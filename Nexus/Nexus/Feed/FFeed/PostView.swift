//
//  PostView.swift
//  Nexus
//
//  Created by Georgina Zeron Cabrera on 09/11/23.
//

import SwiftUI

struct PostView: View {
    let post: Post
    @State private var likes: Int = 0
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack(spacing: 10) {
                post.user.profileImage
                    .resizable()
                    .scaledToFill()
                    .frame(width: 50, height: 50)
                    .clipShape(Circle())
                Text(post.user.name)
                    .font(.headline)
                    .foregroundColor(Color.black)
            }
            
            Text(post.text)
                .font(.body)
                .foregroundColor(.black)
            
            if let imageName = post.imageName {
                Image(imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            }
            
            HStack {
                Button(action: {
                    self.likes += 1
                }) {
                    Label("Me gusta \(likes)", systemImage: "heart")
                }
                .foregroundColor(Color.customPurple)
            }
            .padding(.top, 10)
        }
        .padding()
        .background(Color.clear)
        .cornerRadius(10)
        .shadow(radius: 5)
    }
}

