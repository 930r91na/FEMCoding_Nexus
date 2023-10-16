//
//  CustomColors.swift
//  appFCC3
//
//  Created by MacBookAir on 04/10/23.
//

import Foundation
import SwiftUI

extension Color {
    public static let customPurple: Color = Color(UIColor(red: 193/255, green: 36/255, blue: 107/255, alpha: 255))
    
    public static let customOrange: Color = Color(UIColor(red: 255/255, green: 111/255, blue: 75/255, alpha: 255))
    
    init(customHex: String) {
        let hex = customHex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
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
            blue: Double(b) / 255,
            opacity: Double(a) / 255
        )
    }
}

extension Color {
    static let sunsetOrange = Color(customHex: "FF6F4B")
    static let vibrantRed = Color(customHex: "FD4C55")
    static let rosePink = Color(customHex: "E13661")
    static let deepMagenta = Color(customHex: "C1246B")
    static let darkPurple = Color(customHex: "A11477")
}

