//
//  SupportView.swift
//  Nexus
//
//  Created by Andrea Lima Blanca on 08/11/23.
//
import SwiftUI

struct SupportView: View {
    var body: some View {
        List {
            Section(header: Text("FAQs")) {
                NavigationLink("¿Cómo restablecer mi contraseña?", destination: Text("Instrucciones para restablecer contraseña"))
                NavigationLink("¿Cómo cambiar mi información de perfil?", destination: Text("Instrucciones para cambiar la información de perfil"))
                NavigationLink("¿Cómo buscar mentores en la plataforma?", destination: Text("Instrucciones para buscar mentores"))
            }

            Section(header: Text("Guías de uso")) {
                NavigationLink("Guía de inicio rápido", destination: Text("Contenido de la guía de inicio rápido"))
                NavigationLink("Mejores prácticas de mentoría", destination: Text("Contenido sobre mejores prácticas"))
            }

            Section {
                Button(action: {
                    // Aquí puedes implementar la acción para contactar al soporte
                }) {
                    HStack {
                        Image(systemName: "envelope.fill")
                            .foregroundColor(.blue)
                        Text("Contactar a soporte")
                            .fontWeight(.semibold)
                    }
                }
            }
        }
        .listStyle(GroupedListStyle())
        .navigationBarTitle("Ayuda y Soporte", displayMode: .inline)
    }
}

struct SupportView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            SupportView()
        }
    }
}
