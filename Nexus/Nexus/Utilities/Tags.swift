//
//  Tags.swift
//  AppStudio
//
//  Created by Azuany Mila Cerón on 05/11/23.
//

import SwiftUI

enum TypographyStyle {
    case title(color: Color = Color.pinkLetters)
    case body(color: Color = .black)
    case button(color: Color = .white)
    
    public var color: Color {
        switch self {
        case .title:
            return Color.pinkLetters
        case .body:
            return .black
        case .button:
            return .white
        }
   }
    
    public var align: TextAlignment {
        switch self {
        case .title, .body:
            return .leading
        case .button:
            return .center
        }
   }
    
    public var size: CGFloat {
        switch self {
        case .title:
            return 18
        case .body:
            return 18
        case .button:
            return 16
        }
   }
    
    public var weight: Font.Weight {
        switch self {
        case .body:
            return .light
        case .button, .title:
            return .bold
        }
    }
}

struct BaseTypography: ViewModifier {
    let type: TypographyStyle
    
    func body(content: Content) -> some View {
        content
            .font(.system(size: type.size, weight: type.weight))
            .padding(.vertical, 5)
            .padding(.horizontal, 20)
            .foregroundColor(type.color)
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
    var label: String
    
    var body: some View {
        
        Button(label) {
        }
        .disabled(true)
        .typography(type: .button())
        .background(RoundedRectangle(cornerRadius: 20)
            .fill(Color.pinkBtn))
    }
}

struct TagImg: View {
    var label: String
    var img: String
    
    var body: some View {
        
        Button {} label: {
            Label(label, systemImage: img)
        }
        .disabled(true)
        .typography(type: .button())
        .background(RoundedRectangle(cornerRadius: 20)
            .fill(Color.pinkBtn))
    }
}
