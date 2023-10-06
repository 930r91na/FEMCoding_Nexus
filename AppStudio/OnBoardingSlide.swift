//
//  OnBoardingSlide.swift
//  AppStudio
//
//  Created by Andrea Lima Blanca on 05/10/23.
//

import SwiftUI

struct OnboardingSlide: View {
    let symbolName: String
    let text: String
    let backgroundColor: Color
    let buttonTitle: String
    let buttonAction: () -> Void
    
    var body: some View {
        ZStack {
            backgroundColor.edgesIgnoringSafeArea(.all)
            
            VStack(alignment: .leading, spacing: 20) {
                Image(systemName: symbolName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100)
                    .foregroundColor(.white)  // Icono blanco
                    .padding(.top, 40)
                    .padding(.leading, 20)
                Text(text)
                    .font(.title)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.leading)
                    .padding(.horizontal, 20)
                    .foregroundColor(.white)
            }
            VStack {
                Spacer()
                Button(action: buttonAction) {
                    Text(buttonTitle)
                        .font(.system(size: 25, weight: .bold, design: .default))
                        .foregroundColor(Color(red: 225/255, green: 54/255, blue: 97/255))  // Letra del botón negra
                        .padding(.horizontal, 30)
                        .padding(.vertical, 12)
                        .background(Color.white)  // Fondo blanco del botón
                        .cornerRadius(10)  // Bordes redondeados para el botón
                }
                .padding(.bottom, 40)
            }
        }
    }
}

struct OnboardingView: View {
    var body: some View {
        TabView {
            OnboardingSlide(
                symbolName: "location.circle.fill",
                text: "Habilita el acceso a tu ubicación para mostrarte conexiones en tu zona.",
                backgroundColor: Color(red: 253/255, green: 76/255, blue: 85/255),  // fd4c55
                buttonTitle: "Activar ubicación",
                buttonAction: activateLocation
            )
            
            OnboardingSlide(
                symbolName: "bell.fill",
                text: "Habilita las notificaciones para recibir actualizaciones directamente en tu dispositivo.",
                backgroundColor: Color(red: 225/255, green: 54/255, blue: 97/255),  // e13661
                buttonTitle: "Activar notificaciones",
                buttonAction: activateNotifications
            )
        }
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
        .ignoresSafeArea()
    }
    
    // Funcionalidad del botón "Activar ubicación"
    func activateLocation() {
        print("Activando ubicación...")
        // Aquí tu código para activar la ubicación
    }
    
    // Funcionalidad del botón "Activar notificaciones"
    func activateNotifications() {
        print("Activando notificaciones...")
        // Aquí tu código para activar las notificaciones
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}

