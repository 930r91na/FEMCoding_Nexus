//
//  FeedView.swift
//  Nexus
//
//  Created by MacBookAir on 05/10/23.
//
import SwiftUI

struct FeedView: View {
    let posts: [Post]
    @State private var newPostText: String = ""
    @State private var showingImagePicker: Bool = false
    @State private var newPostImage: UIImage?
    
    var body: some View {
        NavigationView {
            List {
                // Header view for creating a new post
                VStack(alignment: .leading, spacing: 8) {
                
                    ZStack {
                        TextEditor(text: $newPostText)
                            .frame(minHeight: 50)
                            .overlay(
                                RoundedRectangle(cornerRadius: 8)
                                    .stroke(Color.secondary, lineWidth: 1)
                            )
                            .padding(.bottom, 8)
                        
                        if let selectedImage = newPostImage {
                            Image(uiImage: selectedImage)
                                .resizable()
                                .scaledToFit()
                                .frame(height: 200)
                                .cornerRadius(10)
                                .padding(.vertical)
                        }


                        if newPostText.isEmpty {
                            Text("¿Qué estás pensando?")
                                .foregroundColor(.gray)
                                .padding(.all, 8)
                                .frame(maxWidth: .infinity, alignment: .leading)
                        }
                    }
                    
                    HStack {
                        // Button to add an image
                        Button(action: {
                            showingImagePicker = true
                        }) {
                            
                                Image(systemName: "photo.on.rectangle.angled")
                            
                        }.buttonStyle(PlainButtonStyle())
                        
                        Spacer()
                        
                        // Button to post
                        Button(action: {
                            // Handle post action
                            createPost()
                        }) {
                                Text("Publicar")
                                Image(systemName: "paperplane.fill")
                            
                        }.buttonStyle(PlainButtonStyle())
                    }
                }
                .padding()
                
                // Existing posts
                ForEach(posts) { post in
                    PostView(post: post)
                }
            }
            .listStyle(PlainListStyle())
            .sheet(isPresented: $showingImagePicker, onDismiss: loadImage) {
                ImagePicker(image: $newPostImage)
            }
            .navigationTitle("Feed")
        }
    }
    
    private func createPost() {
        // Implement your post creation logic here
    }
    
    private func loadImage() {
        // Handle the image picked from the image picker
    }
}


struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        FeedView(posts: examplePosts)
    }
}

