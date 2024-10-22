//
//  ColorData.swift
//  Kola
//
//  Created by Patrycja Kwaśniewska on 15/10/2024.
//

import Foundation
import SwiftUI

struct ColorData: Identifiable {
    var id = UUID()
    var colorName: String
    var colorValue: Color
    var count: Int
}
