//
//  CreateOpportunityView.swift
//  Nexus
//
//  Created by Georgina Zeron Cabrera on 11/11/23.
//
import SwiftUI

struct CreateOpportunityView: View {
    @State private var title: String = ""
    @State private var hyperlink: String = ""
    @State private var tags: [String] = []
    @State private var image: UIImage? = nil
    @State private var showingImagePicker = false
    @State private var targetAudienceYear: Int = 2023
    @State private var location: String = ""
    @State private var type: String = ""
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Información general")) {
                    TextField("Título", text: $title)
                    TextField("Hipervinculo", text: $hyperlink)
                    TextField("Tipo", text: $type)
                }

                Section(header: Text("Tags")) {
                    HStack {
                        ForEach(tags, id: \.self) { tag in
                            Text(tag)
                                .padding()
                                .background(Color.purple) // Use your custom color here
                                .cornerRadius(10)
                        }
                    }
                    Button("Añade una Tag") {
                        // Logic to add tags
                    }
                }

                Section(header: Text("Imagen")) {
                    if let selectedImage = image {
                        Image(uiImage: selectedImage)
                            .resizable()
                            .scaledToFit()
                    }
                    Button("Añade una imagen") {
                        showingImagePicker = true
                    }
                }

                Section(header: Text("Publico Objetivo & Ubicación")) {
                    Picker("Edad objetivo", selection: $targetAudienceYear) {
                        ForEach(18...45, id: \.self) {
                            Text("\($0)")
                        }
                    }
                    TextField("Ubicación", text: $location)
                }
                
                Button("Publicar Oportunidad") {
                    // Logic to create opportunity
                }
            }
            .navigationTitle("Publicar Oportunidad")
        }
        .sheet(isPresented: $showingImagePicker) {
            ImagePicker(image: $image)
        }
    }
}



#Preview {
    CreateOpportunityView()
}
