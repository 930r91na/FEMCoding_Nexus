//
//  ProfileSets.swift
//  Nexus
//
//  Created by Andrea Lima Blanca on 12/10/23.
//

import SwiftUI

struct ProfileSets: View {
    
    var user: OtherUser
    
    var body: some View {
        
        ZStack {
            
            Rectangle()
                .fill(Color.pinkBg)
                .frame(maxHeight: .infinity)
                .frame(minWidth: 350)
                .clipShape(
                    .rect(
                        topLeadingRadius: 30,
                        bottomLeadingRadius: 10,
                        bottomTrailingRadius: 10,
                        topTrailingRadius: 30
                    )
                )
            
            VStack(alignment: .leading, spacing: 12) {
                
                Text("Sobre mí")
                    .typography(type: .title())
                    .padding(.top, 30)
                Text(user.about)
                    .typography(type: .body())
                
                Text("Básico")
                    .typography(type: .title())

                VStack(alignment: .leading, spacing: 8) {
                    
                    HStack(spacing: 10) {
                        TagImg(label: user.gender, img: "person.fill")
                        TagImg(label: user.location, img: "location.fill")
                    }
                    
                    HStack(spacing: 10) {
                        TagImg(label: user.institution, img: "graduationcap.fill")
                    }
                }
                .padding(.horizontal, 19)
                
                
                Text("Intereses")
                    .typography(type: .title())
                
                VStack(alignment: .leading, spacing: 8) {
                    Tag(label: user.interests0)
                    Tag(label: user.interests1)
                    Tag(label: user.interests2)
                }
                .padding(.horizontal, 19)
                
                Text("Redes sociales")
                    .typography(type: .title())
                
                VStack(alignment: .leading, spacing: 8) {
                    
                    HStack {
                        Image("Insta")
                            .resizable()
                            .frame(width: 30, height: 30)
                        
                        Tag(label: user.ig)
                    }
                    
                    HStack {
                        Image("Twitter")
                            .resizable()
                            .frame(width: 30, height: 30)
                        
                        Tag(label: user.tw)
                    }
                }
                .padding(.horizontal, 19)
                .padding(.bottom, 40)
                
            }
            
        }
        .padding(.vertical, 10)
    }
}


#Preview {
    ProfileSets(user: OtherUser(id: UUID().uuidString, name: "Ana", bio: "Estudiante", location: "Puebla", career: "Sistemas", semester: 5, age: 21, ig: "ana", tw: "ana", about: "hola soy ana", institution: "UDLAP", interests0: "swift", interests1: "", interests2: "", gender: "Femenino", mentor: true, profileImage: "https://storage.needpix.com/rsynced_images/female-2835524_1280.jpg"))
}
