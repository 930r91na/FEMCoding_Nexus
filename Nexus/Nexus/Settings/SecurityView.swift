//
//  Security.swift
//  Nexus
//
//  Created by Georgina Zeron Cabrera on 08/11/23.
//

import SwiftUI

struct SecurityView: View {
    
    @EnvironmentObject private var authModel: AuthViewModel
    
    @State private var oldPassword: String = ""
    @State private var newPassword: String = ""
    @State private var confirmNewPassword: String = ""
    @State private var showingChangePassword = false
    @State private var showingPasswordError = false
    @State private var showingSuccessMessage = false

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Información Personal")) {
                    Text("Correo: \(authModel.user?.email ?? "")")
                    Text("Nombre: \(UserInfo.shared.username)")
                }
                
                Section {
                    Button("Cambiar Contraseña") {
                        showingChangePassword.toggle()
                    }
                }
                /*
                if showingChangePassword {
                    Section(header: Text("Cambiar Contraseña")) {
                        SecureField("Contraseña Antigua", text: $oldPassword)
                        SecureField("Nueva Contraseña", text: $newPassword)
                        SecureField("Confirmar Nueva Contraseña", text: $confirmNewPassword)
                        Button("Cambiar") {
                            if newPassword == confirmNewPassword && oldPassword == currentUser.password {
                                currentUser.password = newPassword
                                showingChangePassword = false
                                showingSuccessMessage = true
                            } else {
                                showingPasswordError = true
                            }
                        }
                    }
                }*/
            }
            .alert("Error", isPresented: $showingPasswordError, actions: {
                Button("OK", role: .cancel) { }
            }, message: {
                Text("Las contraseñas no coinciden o la contraseña antigua no es correcta.")
            })
            .alert("Éxito", isPresented: $showingSuccessMessage, actions: {
                Button("OK", role: .cancel) { }
            }, message: {
                Text("La contraseña ha sido cambiada de manera exitosa.")
            })
            .navigationTitle("Seguridad")
            .navigationBarTitleDisplayMode(.automatic)
        }
    }
}

// Preview
struct SecurityView_Previews: PreviewProvider {
    static var previews: some View {
        SecurityView()
    }
}
