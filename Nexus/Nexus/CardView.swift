//  CardView.swift
//  Nexus
//
//  Created by Andrea Lima Blanca on 05/10/23.
//

import SwiftUI

struct CardView: View {
    let user: OtherUser
    let onRemove: () -> Void
    @State private var translation: CGSize = .zero
    @State private var swipeStatus: SwipeStatus = .none


    enum SwipeStatus {
        case none
        case right
        case left
    }

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .fill(Color(hex: "c1256b"))
                .frame(width: 350, height: 600)
                .shadow(color: .black.opacity(0.3), radius: 10, x: 0, y: 5)
                .overlay(
                    
            ScrollView {
                VStack {
                    // user.profileImage
                    AsyncImage(url: URL(string: user.profileImage)) { image in
                        image.resizable().aspectRatio(contentMode: .fit)
                    } placeholder: {
                        ProgressView()
                    }
                    //.frame(width: 100, height: 100)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                            
                    HStack {
                        VStack(alignment: .leading) {
                            Text(user.name)
                                .font(.title)
                                .foregroundColor(Color.white)
                            Text(user.career)
                                .font(.subheadline)
                                .foregroundColor(Color.white)
                            Text("Semestre: \(user.semester)")
                                .font(.subheadline)
                                .foregroundColor(Color.white)
                            
                        }
                        
                        Spacer()
                    }
                    .padding()
                    .overlay(alignment: .trailing) {
                        
                    if user.mentor {
                        Button(action: {
                            // Aquí puedes agregar una acción para el botón
                            print("Botón star.bubble presionado")
                        }) {
                            Image(systemName: "star.bubble")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 50)  // Ajusta el tamaño según tu preferencia
                                .foregroundColor(.white)
                                .padding()
                        }
                        .padding()
                        .shadow(color: .black.opacity(0.3), radius: 10, x: 0, y: 5)
                    }
                    Spacer()
                }

                // Aquí puedes agregar más información sobre el usuario
                Text(user.bio)
                    .foregroundColor(Color.white)
                    .padding()
                // ... cualquier otra información que quieras mostrar
                
                Spacer(minLength: 80)
                
                ProfileSets(user: user)
            }
        })
            
        if swipeStatus == .right {
            Image(systemName: "person.crop.circle.badge.checkmark")
                .font(.system(size: 80))
                .foregroundColor(.white)
                .opacity(0.7)
                .padding()
        } else if swipeStatus == .left {
            Image(systemName: "person.crop.circle.fill.badge.xmark")
                .font(.system(size: 80))
                .foregroundColor(.white)
                .opacity(0.7)
                .padding()
            }
        }
        .offset(x: translation.width, y: 0)
        .rotationEffect(Angle(degrees: Double(translation.width / 10)))
        .gesture(
            DragGesture()
                .onChanged { value in
                    self.translation = value.translation
                    if self.translation.width > 0 {
                        self.swipeStatus = .right
                    } else if self.translation.width < 0 {
                        self.swipeStatus = .left
                    }
                }
                .onEnded { _ in
                    if self.translation.width > 100 {
                        self.onRemove()
                    } else if self.translation.width < -100 {
                        self.onRemove()
                    } else {
                        self.translation = .zero
                        self.swipeStatus = .none
                    }
                }
        )
    }
}

struct CView: View {
    
    @State private var showingSheet = false
    @State var users = allUsers
    @EnvironmentObject private var authModel: AuthViewModel
    
    var isLoading = false
    
    var body: some View {
        ZStack {
            
            if !MatchModel.shared.matchedUsers.isEmpty {
                
                ForEach(users) { user in
                    CardView(user: user,
                             onRemove: {remove(user: user)}
                    )
                    .stacked(at: users.firstIndex(where: { $0.id == user.id }) ?? 0, outOf: users.count)
                }
                .padding()
                
            } else {
                ProgressView()
                    .onAppear{
                        authModel.listenToAuthState()
                    }
            }
        }
    }
    
    func remove(user: OtherUser) {
        withAnimation {
            if let index = users.firstIndex(where: { $0.id == user.id }) {
                users.remove(at: index)
            }
        }
    }
}

extension View {
    func stacked(at position: Int, outOf total: Int) -> some View {
        let offset = CGFloat(total - position)
        return self.offset(x: 0, y: offset * 10)
        
    }
}

struct CView_Previews: PreviewProvider {
    static var previews: some View {
        CView()
            .environmentObject(AuthViewModel())
    }
}
