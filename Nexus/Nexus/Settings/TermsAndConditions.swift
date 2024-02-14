//
//  TermsAndConditions.swift
//  AppStudio
//
//  Created by Georgina Zeron Cabrera on 05/11/23.
//

import SwiftUI


struct TermsAndConditions: View {
    var body: some View {
        ScrollView { // Agrega el ScrollView aquí
            VStack {
                Text("Terminos y condiciones de uso")
                    .font(.title)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.leading)
                    .padding(.bottom, 20)
                    .padding(.top, 40)
                Text("Agradecemos tu preferencia al descargar Nexus. Es importante mencionar que su información está respaldada con base a los términos de la Ley Federal de protección de datos personales. Cabe mencionar que, si usted acepta dicha solicitud, sus datos e información personal serán resguardados confidencialmente, por lo que no se realizará un mal uso de los mismos, se utilizarán con fines académicos, cumpliendo con las consideraciones bioéticas y el apego de lineamientos y consideraciones de la Ley General de Salud en Materia de Investigación para la Salud sin más por el momento, agradecemos su atención ante dicha solicitud.")
                    .font(.body)
                    .padding(.horizontal, 28.0)
                HStack {
                    Text("Privacidad")
                        .font(.title3)
                        .fontWeight(.bold)
                        .multilineTextAlignment(.leading)
                        .padding(.leading, -168)
                }
                .padding()
                    
            
                Text("El tipo de información que recopilamos es contenido que nos proporcionas, tu uso, la actividad de otros usuarios, la actividad de otros usuarios y la información que proporcionan sobre los, datos de cookies. El uso de esta información es con fines estadísticos; de investigación: para pruebas y solución de problemas; y desarrollo para mejorar nuestros servicios. Otro aspecto que es importante mencionar es que se fomenta la seguridad y protección de datos, usando la información personal que se registra para verificar cuentas y actividades, investigando actividades sospechosas o incumplimiento de las políticas")
                    .padding(.horizontal, 28.0)
            }
        } // Cierra el ScrollView aquí
    }
}

struct TermsAndConditions_Previews: PreviewProvider {
    static var previews: some View {
        TermsAndConditions()
    }
}
