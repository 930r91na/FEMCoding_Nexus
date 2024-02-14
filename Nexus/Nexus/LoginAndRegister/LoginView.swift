//
//  LogInView.swift
//  Nexus
//
//  Created by Andrea Lima Blanca on 06/10/23.
//

import SwiftUI
import Firebase
import FirebaseAnalytics
import FirebaseAuth
import FirebaseAppCheck

struct LoginView: View {
    
    @EnvironmentObject private var authModel: AuthViewModel
    
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var isLoading = false
    @State private var errorMessage: String?
    @State private var showingAlert = false
    @State private var path = NavigationPath()
    
    var body: some View {
        NavigationView {
            ZStack {
                LinearGradient(gradient: Gradient(colors: [Color(hex: "c1246b"), Color(hex: "e13661")]), startPoint: .top, endPoint: .bottom)
                    .edgesIgnoringSafeArea(.all)
                
                VStack(spacing: 20) {
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
                        
                        Text("Bienvenid@ de nuevo")
                            .foregroundColor(Color.white)
                            .font(.title)
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
                       
                        
                        CustomTextfieldLowercased(placeHolder: "Email", imageName: "envelope", bColor: Color(.white), value: $email)
                        CustomSecurefield(placeHolder: "Contraseña", imageName: "lock", bColor: Color(.white), value: $password)
                    }
                    
                    VStack(spacing: 20) {
                        Button(action: {
                            // Lógica para recuperar contraseña
                        }) {
                            Text("¿Olvidaste tu contraseña?")
                                .fontWeight(.medium)
                                .foregroundColor(.white)
                        }
                        
                        if isLoading {
                            ProgressView()
                                .progressViewStyle(CircularProgressViewStyle(tint: Color(hex: "c1246b")))
                        } else {
                            Button("Iniciar sesión") {
                                
                                self.isLoading = true
                                
                                authModel.signIn(email: email, password: password) { error in
                                    if let e = error {
                                        print(e.localizedDescription)
                                        print((e as NSError).code)
                                        print(e)
                                        errorMessage = e.localizedDescription
                                        self.showingAlert = true
                                        self.isLoading = false
                                    } else {
                                        self.isLoading = true
                                    }
                                }
                            }
                            .fontWeight(.bold)
                            .font(.headline)
                            .foregroundColor(Color(hex: "c1246b"))
                            .padding(.horizontal, 50)
                            .padding(.vertical, 15)
                            .background(Color.white)
                            .cornerRadius(12)
                        }
                        
                        NavigationLink {
                            RegisterView()
                        } label: {
                            Text("¿No tienes cuenta? Registrate")
                                .fontWeight(.medium)
                                .foregroundColor(.white)
                        }
                    }
                    .padding(.top, 10)
                }
            }
            .navigationBarTitleDisplayMode(.inline)
        }
        .alert(isPresented: $showingAlert) {
            Alert(title: Text("Error"), message: Text(errorMessage ?? ""), dismissButton: .default(Text("OK")))
        }
        .navigationBarBackButtonHidden()
        .analyticsScreen(name: "LoginView")
        
    }
        
}

#Preview {
    LoginView()
}
