//
//  CardView.swift
//  AppStudio
//
//  Created by Andrea Lima Blanca on 05/10/23.
//

import SwiftUI

struct User: Identifiable {
    let id = UUID()
    let name: String
    let career: String
    let semester: String
    let image: Image
    let bio: String
}


struct CardView: View {
    let user: User
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
                            user.image
                                .resizable()
                                .scaledToFit()
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

                            // Aquí puedes agregar más información sobre el usuario
                            Text(user.bio)
                                .foregroundColor(Color.white)
                                .padding()
                            // ... cualquier otra información que quieras mostrar
                        }
                    }
                )
            HStack {
                    Button(action: {
                        // Aquí puedes agregar una acción para el botón si lo deseas
                        print("Botón star.bubble presionado")
                    }) {
                        Image(systemName: "star.bubble")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 50)  // Ajusta el tamaño según tu preferencia
                            .foregroundColor(.white)
                            .padding()
                    }
                    .shadow(color: .black.opacity(0.3), radius: 10, x: 0, y: 5)
                    .offset(x: 260, y: 100)
                    Spacer()
                }

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
                    } else {
                        self.swipeStatus = .left
                    }
                }
                .onEnded { value in
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
    @State var users: [User] = [
            User(name: "Juana", career: "Ingeniería en Sistemas", semester: "5to", image: Image("juana"), bio: "nosenosenose"),
            User(name: "Maria", career: "Diseño Gráfico", semester: "3ro", image: Image("maria"), bio: "nosenosenose"),
            User(name: "Petra", career: "Ingeniería Civil", semester: "6to", image: Image("petra"), bio: "nosenosenose"),
            User(name: "Ana", career: "Marketing", semester: "4to", image: Image("ana"), bio: "nosenosenose"),
        ]

        var body: some View {
            ZStack {
                ForEach(users) { user in
                    CardView(user: user, onRemove: {
                        remove(user: user)
                    })
                    .stacked(at: users.firstIndex(where: { $0.id == user.id }) ?? 0, outOf: users.count)
                }
            }
            .padding()
        }

        func remove(user: User) {
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


extension Color {
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0

        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (255, 0, 0, 0)
        }

        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue:  Double(b) / 255,
            opacity: Double(a) / 255
        )
    }
}

struct CView_Previews: PreviewProvider {
    static var previews: some View {
        CView()
    }
}
