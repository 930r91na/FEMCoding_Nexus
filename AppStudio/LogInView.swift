//
//  LogInView.swift
//  AppStudio
//
//  Created by Andrea Lima Blanca on 06/10/23.
//

import SwiftUI

struct LoginView: View {
    @State private var username: String = ""
    @State private var password: String = ""

    var body: some View {
        NavigationView {
            ZStack {
                LinearGradient(gradient: Gradient(colors: [Color(hex: "c1246b"), Color(hex: "e13661")]), startPoint: .top, endPoint: .bottom)
                    .edgesIgnoringSafeArea(.all)

                VStack(spacing: 30) {
                    ZStack {
                        Ellipse()
                            .frame(width: 530, height: 498)
                            .padding(.leading, -200)
                            .foregroundColor(.white)
                            .opacity(0.1)
                            .padding(.top, -200)
                        
                        Ellipse()
                            .frame(width: 478, height: 440)
                            .padding(.trailing, -400)
                            .foregroundColor(.white)
                            .opacity(0.1)
                            .padding(.top, -320)

                        Text("Bienvenida de nuevo")
                            .foregroundColor(Color.white)
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .multilineTextAlignment(.center)
                            .padding(.top, -50)
                    }

                    Image(systemName: "person.circle.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 220, height: 220)
                        .foregroundColor(.white)
                        .padding(.top, -150)
                    
                    VStack(spacing: 15) {
                        CustomTextfield(placeHolder: "Email", imageName: "envelope", bColor: Color(.white), value: $username)
                        CustomTextfield(placeHolder: "Contraseña", imageName: "lock", bColor: Color(.white), value: $password)
                        CheckBoxView()
                    }
                    
                    VStack(spacing: 20) {
                        Button(action: {
                            // Lógica para recuperar contraseña
                        }) {
                            Text("¿Olvidaste tu contraseña?")
                                .fontWeight(.medium)
                                .foregroundColor(.white)
                        }

                        Button(action: {
                            login()
                        }) {
                            Text("Iniciar sesión")
                                .fontWeight(.bold)
                                .font(.title)
                                .foregroundColor(Color(hex: "c1246b"))
                                .padding(.horizontal, 50)
                                .padding(.vertical, 15)
                                .background(Color.white)
                                .cornerRadius(12)
                        }
                        .padding(.horizontal, 20)

                        Button(action: {
                            // Lógica de registro
                        }) {
                            Text("¿No tienes cuenta? Registrate")
                                .fontWeight(.medium)
                                .foregroundColor(.white)
                        }
                    }
                    .padding(.top, 10)
                }
            }
        }
    }
    
    func login() {
        // Implementar la lógica de inicio de sesión aquí
        print("Intentando iniciar sesión...")
    }
}

// Extensión y CustomTextField mantienen su definición

struct CustomTextfield: View {
    var placeHolder: String
    var imageName: String
    var bColor: Color
    @Binding var value: String
    
    var body: some View {
        HStack {
            Image(systemName: imageName)
                .foregroundColor(.white)
            TextField(placeHolder, text: $value)
                .padding()
                .foregroundColor(.white)
                .background(bColor.opacity(0.2))  // Opacidad reducida
                .cornerRadius(10)
        }
        .padding(.horizontal, 20)
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}


