//
//  Glow.swift
//  SomethingUsefulSwiftUI
//
//  Created by Gordon Choi on 8/5/25.
//

import SwiftUI

// 내장 모디파이어 I hate this! 재사용하는 모디파이어도 분리하기
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
