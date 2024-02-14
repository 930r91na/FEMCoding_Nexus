
//
//  OnBoardingSlide.swift
//  AppStudio
//
//  Created by Andrea Lima Blanca on 05/10/23.
//

import SwiftUI
import PhotosUI

public struct OnBoardingSlide: View {
    
    let symbolName: String
    let text: String
    let backgroundColor: Color
    let buttons : [(buttonTitle: String, buttonAction: ()->Void)]
    
    
    public var body: some View {
        ZStack {
            backgroundColor.edgesIgnoringSafeArea(.all)
            
            VStack(alignment: .leading, spacing: 20) {
                Image(systemName: symbolName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100)
                    .foregroundColor(.white)  // Icono blanco
                    .padding(.top, 40)
                    .padding(.leading, 20)
                Text(text)
                    .font(.title)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.leading)
                    .padding(.horizontal, 20)
                    .foregroundColor(.white)
            }
            VStack {
                Spacer()
                
                ForEach(buttons, id:\.0) {
                    my_button in
                    
                    Button(action: my_button.1) {
                        Text(my_button.0)
                            .font(.system(size: 25, weight: .bold, design: .default))
                            .foregroundColor(Color(red: 225/255, green: 54/255, blue: 97/255))  // Letra del botón negra
                            .padding(.horizontal, 30)
                            .padding(.vertical, 12)
                            .background(Color.white)  // Fondo blanco del botón
                            .cornerRadius(10)  // Bordes redondeados para el botón
                    }
                    .padding(.bottom, 10)
                    
                }
            }
            .padding(.bottom, 50)
        }
    }
}

public struct OnBoardingPhotoSlide: View {
    
    @Environment(\.modelContext) var context
    @State private var imageSelection: PhotosPickerItem? = nil
    @State private var uiImageSelection = UIImage()
    @State var imageData: Data?
    let text: String
    let backgroundColor: Color
    let buttonTitle: String
    
    public var body: some View {
        
        ZStack {
            backgroundColor.edgesIgnoringSafeArea(.all)
            
            VStack(alignment: .leading, spacing: 20) {
                
                if imageSelection == nil {
                    Image(systemName: "person.circle.fill")
                        .font(.system(size: 100))
                        .foregroundColor(.white)
                }
                else {
                    currentUser.profileImage
                        .resizable()
                        .frame(width: 100, height: 100)
                        .clipShape(Circle())
                        .padding()
                }

                Text(text)
                    .font(.title)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.leading)
                    .padding(.horizontal, 20)
                    .foregroundColor(.white)
            }
            
            VStack {
                Spacer()
                
                PhotosPicker(selection: $imageSelection, matching: .any(of: [.images, .not(.livePhotos)]), photoLibrary: .shared()) {
                    Text(buttonTitle)
                        .font(.system(size: 25, weight: .bold, design: .default))
                        .foregroundColor(Color(red: 225/255, green: 54/255, blue: 97/255))
                        .padding(.horizontal, 30)
                        .padding(.vertical, 12)
                        .background(Color.white)
                        .cornerRadius(10)
                }
                .buttonStyle(.borderless)
                .padding(.bottom, 40)
            }
        }
        .task(id: imageSelection){
            if let data = try? await imageSelection?.loadTransferable(type: Image.self) {
                currentUser.profileImage = data
            }
        }
    }
}

// Example of a function to handle image picker selection and save image
func handleImageSelection(image: UIImage) async {
    // Convert UIImage to Data
    if let imageData = image.jpegData(compressionQuality: 1) {
        // Get the documents directory URL
        let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        // Create a unique image filename
        let imageName = "pickedImage_\(UUID().uuidString).jpg"
        // Create the full file URL
        let imageUrl = documentsDirectory.appendingPathComponent(imageName)
        
        do {
            // Write the data to disk
            try imageData.write(to: imageUrl)
            // Store the image name in your user model
            DispatchQueue.main.async {
// MARK:                currentUser.profileImage = imageName
            }
        } catch {
            print("Error saving image: \(error)")
        }
    }
}
//
//// Example ImagePicker usage
//struct ContentView: View {
//    @State private var isImagePickerPresented = false
//    @State private var pickedImage: UIImage?
//
//    var body: some View {
//        Button("Pick Image") {
//            isImagePickerPresented = true
//        }
//        .sheet(isPresented: $isImagePickerPresented) {
//// MARK:            ImagePicker(selectedImage: $pickedImage, isPresented: $isImagePickerPresented)
//        }
//        .onChange(of: pickedImage) { newImage in
//            if let image = newImage {
//                Task {
//                    await handleImageSelection(image: image)
//                }
//            }
//        }
//    }
//}
//
