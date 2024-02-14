//
//  PosLaunch.swift
//  Nexus
//
//  Created by Georgina Zeron Cabrera on 04/11/23.
//

import SwiftUI

struct PostLaunch: View {
    
    var body: some View {
        NavigationView {
            VStack(spacing: 10) {
                VStack(spacing: 20) {
                    Image("Nexus")
                        .resizable()
                        .frame(width: 200, height: 200)
                        .padding(15)
                    Text("Bienvenido a NEXUS")
                        .font(.title.bold())
                    Text("Tu guía en el mundo STEM")
                        .font(.title2)
                        .fontWeight(.medium)
                        .lineLimit(11)
                        .padding(.top, 0.0)
                        
                }
                .padding(15)
                NavigationLink(destination: RegisterView().navigationBarBackButtonHidden(true)) {
                    Text("Registrarse")
                        .font(.title2)
                        .fontWeight(.medium)
                        .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                        .background(Color.customOrange)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                    
                }
                .padding(15)
                
                NavigationLink(destination: LoginView()) {
                    Text("Iniciar Sesión")
                        .font(.title2)
                        .fontWeight(.medium)
                        .padding()
                        .background(Color(Color.customPurple))
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
            }
            .padding(15)
        }
    }
}

#Preview {
    PostLaunch()
}
