//
//  ProfileSets.swift
//  AppStudio
//
//  Created by Andrea Lima Blanca on 12/10/23.
//

import SwiftUI



struct ProfileSets: View {
    
    
    
    var body: some View {
        
        ZStack {
            
            RoundedRectangle(cornerRadius: 50)
                .fill(Color.pink_bg)
                .opacity(0.7)
                .frame(width: 394, height: 650)
            
            VStack(alignment: .leading, spacing: 12) {
                
                Text("Sobre mí")
                    .typography(type: .title())
                Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque tempus, ex quis dignissim laoreet, nunc eros porta mauris, nec auctor leo ex in orci. Vestibulum elementum in diam nec aliquam.")
                    .typography(type: .body())
                
                Text("Básico")
                    .typography(type: .title())

                VStack(alignment: .leading, spacing: 8) {
                    
                    HStack(spacing: 10) {
                        Tag_img(label: "Femenino", img: "person.fill")
                        Tag_img(label: "Estudiante", img: "book.closed.fill")
                    }
                    
                    HStack(spacing: 10) {
                        Tag_img(label: "UDLAP", img: "graduationcap.fill")
                        Tag_img(label: "México", img: "location.fill")
                    }
                }
                .padding(.horizontal, 19)
                
                
                Text("Intereses")
                    .typography(type: .title())
                
                VStack(alignment: .leading, spacing: 8) {
                    
                    HStack(spacing: 10) {
                        Tag(label: "Química")
                        Tag(label: "Nanotecnología")
                    }
                    
                    HStack(spacing: 10) {
                        Tag(label: "Biomédica")
                    }
                }
                .padding(.horizontal, 19)
                
                Text("Redes sociales")
                    .typography(type: .title())
                
                VStack(alignment: .leading, spacing: 8){
                    
                    HStack {
                        Image("Insta")
                            .resizable()
                            .frame(width: 30, height: 30)
                        
                        Tag(label: "rosa_009_perfil")
                    }
                    
                    HStack {
                        Image("Twitter")
                            .resizable()
                            .frame(width: 30, height: 30)
                        
                        Tag(label: "rosasGasp")
                    }
                }
                .padding(.horizontal, 19)
                
            }
            
        }
    }
}

extension Color {
    static let orange_btn = Color(red: 255/255, green: 99/255, blue: 67/255)
    static let pink_bg = Color(red: 222/255, green: 48/255, blue: 87/255)
    static let pink_letters = Color(red: 186/255, green: 34/255, blue: 96/255)
    static let pink_btn = Color(red: 193/255, green: 36/255, blue: 107/255)
}

enum TypographyStyle {
    case title(color: Color = Color.pink_letters)
    case body(color: Color = .black)
    case button(color: Color = .white)
    
    public var color: Color {
        switch self {
            case .title: return Color.pink_letters
            case .body: return .black
            case .button: return .white
      }
   }
    
    public var align: TextAlignment {
        switch self {
            case .title, .body: return .leading
            case .button: return .center
      }
   }
    
    public var size: CGFloat {
        switch self {
            case .title: return 18
            case .body: return 18
            case .button: return 18
      }
   }
    
    public var weight: Font.Weight {
        switch self {
            case .body: return .light
            case .button, .title: return .bold
      }
   }
}

struct BaseTypography: ViewModifier {
    let type: TypographyStyle
    //let color: Color = .black
    
    func body(content: Content) -> some View {
        content
            .font(.system(size: type.size, weight: type.weight))
            .padding(.vertical, 5)
            .padding(.horizontal, 20)
            .foregroundColor(type.color)
            //.width(type.width)
            .multilineTextAlignment(type.align)
    }
}

extension View {
    func typography(type: TypographyStyle) -> some View {
        switch type {
            case .title, .body, .button:
                return self.modifier(BaseTypography(type: type))
          }
   }
}


struct Tag: View {
    var label : String
    
    var body: some View {
        
        Button(label) {
        }
        .disabled(true)
        .typography(type: .button())
        .background(RoundedRectangle(cornerRadius: 20)
            .fill(Color.pink_btn))
    }
}

struct Tag_img: View {
    var label : String
    var img : String
    
    var body: some View {
        
        Button {} label: {
            Label(label, systemImage: img)
        }
        .disabled(true)
        .typography(type: .button())
        .background(RoundedRectangle(cornerRadius: 20)
            .fill(Color.pink_btn))
    }
}

#Preview {
    ProfileSets()
}
