//
//  ProfileView.swift
//  Nexus
//
//  Created by MacBookAir on 05/10/23.
//
import SwiftUI
import PhotosUI

struct ProfileView: View {
    @EnvironmentObject private var authModel: AuthViewModel
    let mentorsIds = [testUser.id, testUser2.id]
    let menteesIds = [testUser3.id]

    @State private var showMentoresInfo = false
    @State private var showMentoradosInfo = false

    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    NavigationLink {
                        Settings()
                    } label: {
                        Image(systemName: "gearshape").foregroundColor(.black)
                            .font(.system(size: 23))
                    }
                    
                    Spacer()

                    NavigationLink {
                        NotificationsView()
                    } label: {
                        mailIconWithBadge(count: notifications.count)
                            .foregroundColor(.black)
                            .font(.system(size: 23))
                    }
                }
                .padding()
                
                ScrollView {
                    VStack {
                        AsyncImage(url: URL(string: UserInfo.shared.profileImage)) { image in
                            image.resizable().aspectRatio(contentMode: .fit)
                        } placeholder: {
                            //ProgressView()
                        }
                        .frame(width: 100, height: 100)
                        .clipShape(Circle())
                        
                        Text(UserInfo.shared.username)
                            .font(.title)
                            .fontWeight(.bold)
                        Text(UserInfo.shared.bio)
                            .multilineTextAlignment(.center)
                        Text(UserInfo.shared.location)
                        
                        NavigationLink {
                            //EditProfileView()
                        } label: {
                            Text("Edit profile")
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(Color.customPurple)
                                .foregroundColor(.white)
                                .cornerRadius(10)
                        }
                        .padding()
                        
                        Section(header: Button(action: { showMentoresInfo = true }) {
                                    Text("Mentores").font(.headline)
                            .foregroundColor(Color.customPurple)
                                }) {
                            if mentorsIds.isEmpty {
                                Text("No tienes mentores, Change it")
                                    .onTapGesture {
                                        CView()
                                    }
                            } else {
                                CarouselView(ids: mentorsIds)
                            }
                        }
                        
                        Section(header: Button(action: { showMentoradosInfo = true }) {
                                    Text("Mentorados").font(.headline)
                                .foregroundColor(Color.customPurple)
                                }) {
                            if menteesIds.isEmpty {
                                Text("No tienes mentorados, Cambialo")
                                    .onTapGesture {
                                        EditProfileView()
                                    }
                            } else {
                                CarouselView(ids: menteesIds)
                            }
                        }
                        
                        Section(header: Text("Posts").font(.headline)) {
                            LazyVGrid(columns: [GridItem(), GridItem(), GridItem()]) {
                                ForEach(examplePosts) { post in
                                    if let imageName = post.imageName {
                                        Image(imageName)
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .frame(width: 100, height: 100)
                                            .cornerRadius(10)
                                    }
                                }
                            }
                            .padding()
                        }
                    }
                }
            }
            .sheet(isPresented: $showMentoresInfo) {
                InfoView(image: "b1", title: "¿Qué significa ser Mentor?", detail: "Ser mentor significa usar tu experiencia y conocimientos para guiar y apoyar a quienes inician su trayectoria profesional. A través de tu orientación, contribuyes significativamente al crecimiento y desarrollo de otros, a la vez que refuerzas tus propias habilidades de liderazgo y comunicación. Ser mentor es una experiencia gratificante que no solo impacta en la carrera de tu mentorado, sino que también amplía tu perspectiva y fortalece tu propio crecimiento profesional.", bgback: "Image1 1", medidas1: 300, medidas2: 300)
            }
            .sheet(isPresented: $showMentoradosInfo) {
                InfoView(image: "b2", title: "¿Qué significa ser Mentorado?", detail: "Como mentorado, te sumerges en un entorno de aprendizaje enriquecido, guiado por expertos que ofrecen consejos y conocimientos prácticos. Esta relación te permite desarrollar habilidades vitales, enfrentar desafíos con mayor confianza y construir una red de contactos profesionales. Te beneficias al recibir orientación personalizada, lo que acelera tu desarrollo y facilita tu camino hacia el éxito.", bgback: "Image2", medidas1: 300, medidas2: 300)
            }
        }
    }

    @ViewBuilder
    private func mailIconWithBadge(count: Int) -> some View {
        ZStack(alignment: .topTrailing) {
            Image(systemName: "envelope")
                .foregroundColor(.black)
                .font(.system(size: 23))
            
            if count > 0 {
                Circle()
                    .fill(Color.red)
                    .frame(width: 15, height: 15)
                    .overlay(
                        Text("\(min(count, 99))")
                            .font(.caption2)
                            .foregroundColor(.white)
                    )
                    .offset(x: 8, y: -8)
            }
        }
    }
}

#Preview {
    ProfileView()
        .environmentObject(AuthViewModel())
}

