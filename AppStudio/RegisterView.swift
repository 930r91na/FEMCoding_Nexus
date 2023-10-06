//
//  RegisterView.swift
//  AppStudio
//
//  Created by Andrea Lima Blanca on 06/10/23.
//

import SwiftUI

struct RegisterView: View {
    @State private var fullName: String = ""
    @State private var email: String = ""
    @State private var age: String = ""
    @State private var career: String = ""

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

                        Text("Hola, ¿eres nueva?")
                            .foregroundColor(Color.white)
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .multilineTextAlignment(.center)
                            .padding(.top, -100)
                        Text("Regístrate")
                            .foregroundColor(Color.white)
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .padding(.top, -40)
                        
                    }
                    VStack(spacing: 10){
                        Image(systemName: "person.3")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 220, height: 220)
                            .foregroundColor(.white)
                            .padding(.top, -200)
                    }
                    VStack(spacing: 15) {

                        CustomTextfield(placeHolder: "Nombre completo", imageName: "person.fill", bColor: Color( .white), value: $fullName)
                        CustomTextfield(placeHolder: "Correo", imageName: "envelope", bColor: Color(.white), value: $email)
                        CustomTextfield(placeHolder: "Edad", imageName: "number", bColor: Color(.white), value: $age)
                        CustomTextfield(placeHolder: "Carrera", imageName: "book", bColor: Color(.white), value: $career)
                    }
                    
                    VStack(spacing: 20) {
                        Button(action: {
                            register()
                        }) {
                            Text("Registrarse")
                                .fontWeight(.bold)
                                .font(.title)
                                .foregroundColor(Color(hex: "c1246b"))
                                .padding(.horizontal, 50)
                                .padding(.vertical, 15)
                                .background(Color.white)
                                .cornerRadius(12)
                        }
                        .padding(.horizontal, 20)
                    }
                    .padding(.top, 20)
                }
            }
        }
    }
    
    func register() {
        // Implementar la lógica de registro aquí
        print("Intentando registrarse...")
    }
}

// Las demás definiciones como CustomTextField y la extensión de Color mantienen su definición

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
