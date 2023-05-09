//
//  Constants.swift
//  YardCall
//
//  Created by Jacob Gambrell on 4/14/23.
//

import Foundation
import SwiftUI

extension Color {
    static let background = Color("backgroundColor")
    static let card = Color("cardColor")
    static let card2 = Color("cardColor2")
    static let perfectblue = Color("perfectblue")
    static let lightgreen = Color("lightgreen")
}

// Extension for adding rounded corners to specific corners
extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape(RoundedCorner(radius: radius, corners: corners) )
    }
}

// Custom RoundedCorner shape used for cornerRadius extension above
struct RoundedCorner: Shape {
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}
