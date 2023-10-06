//
//  ProfileView.swift
//  appFCC3
//
//  Created by MacBookAir on 05/10/23.
//
import SwiftUI

struct ProfileView: View {
    @State private var navigateToNewScreen = false
    
    var body: some View {
        NavigationView {
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
                    Image("profile_picture") // Asegúrate de tener esta imagen en tu paquete de activos
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
                NavigationLink(destination: ProfileSets(), isActive: $navigateToNewScreen) {
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
                            Image("sample_image")
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
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
