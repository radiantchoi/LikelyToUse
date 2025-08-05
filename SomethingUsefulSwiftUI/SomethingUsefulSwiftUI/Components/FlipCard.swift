//
//  FlipCard.swift
//  SomethingUsefulSwiftUI
//
//  Created by Gordon Choi on 8/5/25.
//

import SwiftUI

struct FlipCard<Front: View, Back: View>: View {
    let front: Front
    let back: Back
    
    @State private var isFlipped = false
    
    var body: some View {
        ZStack {
            front
                .opacity(isFlipped ? 0 : 1)
                .rotation3DEffect(
                    .degrees(isFlipped ? 180 : 0),
                    axis: (x: 0, y: 1, z: 0)
                )
            
            back
                .opacity(isFlipped ? 1 : 0)
                .rotation3DEffect(
                    .degrees(isFlipped ? 0 : -180),
                    axis: (x: 0, y: 1, z: 0)
                )
        }
        .animation(.spring(), value: isFlipped)
        .onTapGesture {
            isFlipped.toggle()
        }
    }
}
