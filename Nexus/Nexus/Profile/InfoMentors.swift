//
//  InfoMentors.swift
//  Nexus
//
//  Created by Georgina Zeron Cabrera on 12/11/23.
//

import SwiftUI


struct InfoView: View {
    
    var image: String
    var title: String
    var detail: String
    var bgback: String
    var medidas1: CGFloat
    var medidas2: CGFloat
    @AppStorage ("currentPage") var currentPage = 1
    @State private var navigateToMenuPrincipal = false
    var body: some View {
        
        VStack(spacing:20){
            
            HStack{
               

            } .foregroundColor(.black)
                .padding()
            Spacer()

            Image(image)
                .resizable()
                .frame(width: medidas1, height: medidas2)
                .aspectRatio(contentMode: .fit)
                .padding(.top, -100)
            Text(title)
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.black)
                .padding(.top, -25)
            ScrollView {
                Text(detail)
                    .kerning(1.0)
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.leading)
                    .padding()
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal)
            }
            Spacer(minLength: 50)
            
        }
        .background(RoundedRectangle(cornerRadius: 25.0)
            .fill(.ultraThinMaterial)
            .frame(width:375, height: 610))
        .background(Image(bgback)
            .resizable()
            .frame(width:750, height: 1000))
    }
}


#Preview {
    InfoView(image: "b1", title: "¿Qué significa ser Mentor?", detail: "Ser mentorado significa embarcarse en un viaje de aprendizaje guiado, donde recibes consejos y orientación para tu desarrollo académico y profesional. Responsabilidades incluyen una actitud proactiva en tu educación, la disposición a aceptar y actuar según el feedback, y el compromiso de aplicar lo aprendido. Beneficios: Aprovechas la experiencia y el conocimiento de profesionales expertos, desarrollas habilidades cruciales para tu futuro y te integras en una red de apoyo que fomenta tu crecimiento y éxito.", bgback: "Image1 1", medidas1: 300, medidas2: 300)
    
}
