//
//  CustomColors.swift
//  Nexus
//
//  Created by MacBookAir on 04/10/23.
//

import SwiftUI

extension Color {
    public static let customPurple: Color = Color(UIColor(red: 193/255, green: 36/255, blue: 107/255, alpha: 255))
    
    public static let customOrange: Color = Color(UIColor(red: 255/255, green: 111/255, blue: 75/255, alpha: 255))
    
    public static let grayBg = Color(red: 241/255, green: 241/255, blue: 245/255)
    
    public static let orangeBtn = Color(red: 255/255, green: 99/255, blue: 67/255)
    
    public static let pinkBg = Color(red: 217/255, green: 117/255, blue: 138/255)
    
    public static let pinkLetters = Color(red: 186/255, green: 34/255, blue: 96/255)
    
    public static let pinkBtn = Color(red: 193/255, green: 36/255, blue: 107/255)

    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0

        Scanner(string: hex).scanHexInt64(&int)
        let add, red, green, blue: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (add, red, green, blue) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (add, red, green, blue) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (add, red, green, blue) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (add, red, green, blue) = (255, 0, 0, 0)
        }

        self.init(
            .sRGB,
            red: Double(red) / 255,
            green: Double(green) / 255,
            blue: Double(blue) / 255,
            opacity: Double(add) / 255
        )
    }
}
