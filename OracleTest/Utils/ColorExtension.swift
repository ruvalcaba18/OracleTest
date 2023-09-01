//  ColorExtension.swift
//  OracleTest
//  Created by Jael  on 29/08/23.


import SwiftUI

extension Color {
    static let customGray = Color(hex: 0x424242)
    static let customGold = Color(hex: 0xFFD700)
}
extension Color {
    init(hex: Int, opacity: Double = 1) {
        self.init(
            .sRGB,
            red: Double((hex >> 16) & 0xff) / 255,
            green: Double((hex >> 8) & 0xff) / 255,
            blue: Double(hex & 0xff) / 255,
            opacity: opacity
        )
    }
}
