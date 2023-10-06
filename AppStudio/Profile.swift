//
//  Profile.swift
//  AppStudio
//
//  Created by Andrea Lima Blanca on 13/10/23.
//

import SwiftUI

struct Profile: View {
    var body: some View {
        VStack {
            // Parte superior de la pantalla
            HStack {
                Image(systemName: "gearshape")
                Spacer()
                Image(systemName: "ellipsis.circle")
            }
            .padding()
            
            // Foto de perfil y nombre
            VStack {
                Image("profile_picture") // Asume que tienes una imagen llamada "profile_picture"
                    .resizable()
                    .clipShape(Circle())
                    .frame(width: 120, height: 120)
                    .overlay(Circle().stroke(Color.white, lineWidth: 4))
                    .shadow(radius: 10)
                
                Text("Marina Torres")
                    .font(.title)
                    .fontWeight(.bold)
                Text("Estudiante")
                Text("Puebla, México")
            }
            .padding()
            
            // Botón de editar perfil
            Button(action: {
                // Acción del botón
            }) {
                Text("Edit profile")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.pink)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .padding()
            
            // Galería de imágenes
            ScrollView {
                LazyVGrid(columns: [GridItem(), GridItem(), GridItem()]) {
                    ForEach(0..<9) { _ in
                        Image("sample_image") // Asume que tienes una imagen de muestra llamada "sample_image"
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 100, height: 100)
                            .cornerRadius(10)
                    }
                }
            }
            .padding()
            
            Spacer()
        }
    }
}

struct Profile_Previews: PreviewProvider {
    static var previews: some View {
        Profile()
    }
}
