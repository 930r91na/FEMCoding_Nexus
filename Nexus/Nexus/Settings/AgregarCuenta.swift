//
//  AgregarCuenta.swift
//  Ayuda
//
//  Created by Andrea Lima Blanca on 08/11/23.
//

import SwiftUI

struct AddAccountView: View {
    @State private var username: String = ""
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var confirmPassword: String = ""
    @State private var isAccountAdded: Bool = false
    @State private var showingAlert = false
    @State private var alertMessage: String = ""

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Nombre de Usuario")) {
                    TextField("Nombre de Usuario", text: $username)
                }
                
                Section(header: Text("Correo Electrónico")) {
                    TextField("Correo Electrónico", text: $email)
                        .autocapitalization(.none)
                        .keyboardType(.emailAddress)
                }
                
                Section(header: Text("Contraseña")) {
                    SecureField("Contraseña", text: $password)
                    SecureField("Confirmar Contraseña", text: $confirmPassword)
                }
                
                Section {
                    Button("Agregar Cuenta") {
                        addAccount()
                    }
                    .disabled(username.isEmpty || email.isEmpty || password.isEmpty || confirmPassword.isEmpty || password != confirmPassword)
                }
            }
            .navigationBarTitle("Agregar Cuenta")
            .alert(isPresented: $showingAlert) {
                Alert(title: Text("Error"), message: Text(alertMessage), dismissButton: .default(Text("OK")))
            }
        }
    }
    
    func addAccount() {
        guard password == confirmPassword else {
            alertMessage = "Las contraseñas no coinciden."
            showingAlert = true
            return
        }
        
        // Aquí, implementa la lógica para agregar la cuenta, como una llamada a una API o base de datos.
        // Simularemos que la cuenta se ha añadido exitosamente.
        isAccountAdded = true
        clearForm()
    }
    
    func clearForm() {
        username = ""
        email = ""
        password = ""
        confirmPassword = ""
    }
}

struct AddAccountView_Previews: PreviewProvider {
    static var previews: some View {
        AddAccountView()
    }
}
