//
//  Settings.swift
//  Nexus
//
//  Created by Andrea Lima Blanca on 14/10/23.
//

import SwiftUI

struct Settings: View {
    
    @EnvironmentObject private var authModel: AuthViewModel
    
    enum Language: String, CaseIterable, Identifiable {
            case español, english, française, deutsch
            var id: Self { self }
        }
    @State private var selectedLanguage: Language = .español
    
    //var viewModel = LoginViewModel.shared
    
    var body: some View {
        NavigationView {
            
            List {
                Section(header: Text("Cuenta")) {
                    
                    NavigationLink(destination: EditProfileView(), label: {Label("Editar perfil", systemImage: "person")})
                    
                    NavigationLink(destination: SecurityView(), label: {Label("Seguridad", systemImage: "exclamationmark.shield")})
                    
                    NavigationLink(destination: NotificationsView(), label: {Label("Notificaciones", systemImage: "bell")})
                    
                    NavigationLink(destination: Settings() /*Cambiar pantalla*/, label: {Label("Privacidad", systemImage: "lock")})
                    
                }
                .listRowBackground(Color.grayBg)

                Section(header: Text("Soporte e Información")) {
                    
                    NavigationLink(destination: SupportView(), label: {Label("Ayuda y soporte", systemImage: "questionmark.circle")})
                    
                    NavigationLink(destination: TermsAndConditions(), label: {Label("Términos y Condiciones", systemImage: "info.circle")})
                }
                .listRowBackground(Color.grayBg)
                
                Section(header: Text("Acciones")) {
                    
                    NavigationLink(destination: AyudaSoporte() /*Cambiar pantalla*/, label: {Label("Reportar un problema", systemImage: "flag")})
                    
                    NavigationLink(destination: AddAccountView(), label: {Label("Añadir una cuenta", systemImage: "person.2.badge.gearshape")})
                    
                    /*NavigationLink(destination: PostLaunch(), label: {Label("Salir", systemImage: "rectangle.portrait.and.arrow.right")})
                        .navigationBarBackButtonHidden()*/
                }
                .listRowBackground(Color.grayBg)
                
                Button{
                    authModel.signOut()
                } label: {
                    Label("Salir", systemImage: "rectangle.portrait.and.arrow.right")
                }
                
                Section(header: Text("Idioma")) {
                    
                    Picker("Seleccionar idioma", selection: $selectedLanguage) {
                        ForEach(Language.allCases) { language in
                            Text(language.rawValue.capitalized).font(.system(size: 16))
                        }
                    }
                }
                .listRowBackground(Color.grayBg)
                
            }
            .foregroundColor(.black)
            .font(.system(size: 16, weight: .semibold))
            .headerProminence(.increased)
            .scrollContentBackground(.hidden)
            .navigationBarBackButtonHidden()
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
