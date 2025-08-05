//
//  Glow.swift
//  SomethingUsefulSwiftUI
//
//  Created by Gordon Choi on 8/5/25.
//

import SwiftUI

struct Glow: ViewModifier {
    let color: Color
    
    func body(content: Content) -> some View {
        content
            .shadow(color: color, radius: 10, x: 0, y: 0)
            .shadow(color: color.opacity(0.5), radius: 20, x: 0, y: 0)
    }
}

extension View {
    func glow(color: Color = .yellow) -> some View {
        self.modifier(Glow(color: color))
    }
}
