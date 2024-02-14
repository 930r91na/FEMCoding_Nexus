//
//  AyudaSoporte.swift
//  Nexus
//
//  Created by Andrea Lima Blanca on 08/11/23.
//

import SwiftUI

struct AyudaSoporte: View {
    @State private var userName: String = ""
    @State private var userEmail: String = ""
    @State private var problemDescription: String = ""
    @State private var isSendingReport = false
    @State private var showAlert = false
    @State private var alertMessage = ""
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Información del usuario")) {
                    TextField("Nombre", text: $userName)
                    TextField("Correo electrónico", text: $userEmail)
                        .autocapitalization(.none)
                        .keyboardType(.emailAddress)
                }
                
                Section(header: Text("Descripción del problema")) {
                    TextEditor(text: $problemDescription)
                        .frame(height: 200)
                }
                
                if isSendingReport {
                    Section {
                        HStack {
                            Spacer()
                            ProgressView()
                                .progressViewStyle(CircularProgressViewStyle())
                            Spacer()
                        }
                    }
                } else {
                    Section {
                        Button(action: sendReport) {
                            Text("Enviar reporte")
                        }
                        .disabled(isSendingReport) // Desactiva el botón cuando se está enviando el reporte.
                    }
                }
            }
            .navigationBarTitle("Reportar un problema", displayMode: .inline)
            .alert(isPresented: $showAlert) {
                Alert(title: Text("Soporte"), message: Text(alertMessage), dismissButton: .default(Text("OK")))
            }
        }
    }
    
    func sendReport() {
        // Validar los datos ingresados antes de enviar
        guard !userName.isEmpty, !userEmail.isEmpty, !problemDescription.isEmpty else {
            alertMessage = "Por favor, completa todos los campos antes de enviar el reporte."
            showAlert = true
            return
        }

        // Mostrar la vista de carga
        isSendingReport = true
        
        // Aquí añades la lógica para enviar los datos al backend
        // Para este ejemplo, solo simularemos un envío exitoso después de un retraso
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) { // Simula un retraso de 2 segundos
            // Aquí manejarías la respuesta del servidor
            
            // Simulación de respuesta del servidor
            self.isSendingReport = false
            self.alertMessage = "Tu reporte ha sido enviado con éxito."
            self.showAlert = true
            
            // Limpiar campos después de enviar
            self.userName = ""
            self.userEmail = ""
            self.problemDescription = ""
        }
    }
}

struct AyudaSoporte_Previews: PreviewProvider {
    static var previews: some View {
        AyudaSoporte()
    }
}
