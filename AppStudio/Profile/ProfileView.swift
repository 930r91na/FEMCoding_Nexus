import SwiftUI

struct ProfileView: View {
    @State private var navigateToNewScreen = false
    @State private var navigateToSettings = false
    
    var body: some View {
        NavigationView {
            VStack {
                // Parte superior de la pantalla
                HStack {
                    Button(action: {
                        navigateToSettings.toggle()
                    }, label: {
                        Image(systemName: "gearshape")
                    })
                    Spacer()
                    Image(systemName: "ellipsis.circle")
                }
                .padding()

                // Foto de perfil y nombre
                VStack {
                    Image("profile_picture")
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
                NavigationLink(destination: EditProfileView(), isActive: $navigateToNewScreen) {
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
            .background(
                NavigationLink("", destination: Settings(), isActive: $navigateToSettings)
            )
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
