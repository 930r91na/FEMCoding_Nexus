//
//  Settings.swift
//  AppStudio
//
//  Created by Andrea Lima Blanca on 14/10/23.
//

import SwiftUI

extension Color {
    static let gray_bg = Color(red: 241/255, green: 241/255, blue: 245/255)
}

struct Settings: View {
    
    enum Language: String, CaseIterable, Identifiable {
            case español, english, française, deutsch
            var id: Self { self }
        }
    @State private var selectedLanguage: Language = .español
    
    
    var body: some View {
        NavigationView{
            
            List {
                
                Section(header: Text("Cuenta")) {
                    
                    NavigationLink(destination: Settings() /*Cambiar pantalla*/, label: {Label("Editar perfil", systemImage:  "person")})
                    
                    NavigationLink(destination: Settings() /*Cambiar pantalla*/, label: {Label("Seguridad", systemImage:  "exclamationmark.shield")})
                    
                    NavigationLink(destination: Settings() /*Cambiar pantalla*/, label: {Label("Notificaciones", systemImage:  "bell")})
                    
                    NavigationLink(destination: Settings() /*Cambiar pantalla*/, label: {Label("Privacidad", systemImage:  "lock")})
                    
                }
                .listRowBackground(Color.gray_bg)
                
                Section(header: Text("Soporte e Información")) {
                    
                    NavigationLink(destination: Settings() /*Cambiar pantalla*/, label: {Label("Ayuda y soporte", systemImage:  "questionmark.circle")})
                    
                    NavigationLink(destination: Settings() /*Cambiar pantalla*/, label: {Label("Términos y Condiciones", systemImage:  "info.circle")})
                }
                .listRowBackground(Color.gray_bg)
                
                Section(header: Text("Acciones")) {
                    
                    NavigationLink(destination: Settings() /*Cambiar pantalla*/, label: {Label("Reportar un problema", systemImage:  "flag")})
                    
                    NavigationLink(destination: Settings() /*Cambiar pantalla*/, label: {Label("Añadir una cuenta", systemImage:  "person.2.badge.gearshape")})
                    
                    NavigationLink(destination: Settings() /*Cambiar pantalla*/, label: {Label("Salir", systemImage:  "rectangle.portrait.and.arrow.right")})
                }
                .listRowBackground(Color.gray_bg)
                
                Section(header: Text("Idioma")) {
                    
                    Picker("Seleccionar idioma", selection: $selectedLanguage) {
                        ForEach(Language.allCases) { language in
                            Text(language.rawValue.capitalized).font(.system(size: 16))
                        }
                    }
                }
                .listRowBackground(Color.gray_bg)
                
            }
            .foregroundColor(.black)
            .font(.system(size: 16, weight: .semibold))
            .headerProminence(.increased)
            .scrollContentBackground(.hidden)
            .navigationTitle("Configuración")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("Configuración").font(.system(size: 24, weight: .bold))
                }
            }
        }
        .padding()
        
    }
}

#Preview {
    Settings()
}
