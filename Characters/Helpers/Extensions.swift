//
//  Extensions.swift
//  Characters
//
//  Created by Ahmed Serdah on 12/01/2025.
//

import Foundation
import SwiftUI

extension Color {
    static func random() -> Color {
        return Color(
            red: Double.random(in: 0...1),
            green: Double.random(in: 0...1),
            blue: Double.random(in: 0...1)
        )
    }
}
