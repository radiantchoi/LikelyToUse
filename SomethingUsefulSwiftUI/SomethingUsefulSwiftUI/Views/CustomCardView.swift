//
//  CustomCardView.swift
//  SomethingUsefulSwiftUI
//
//  Created by Gordon Choi on 8/5/25.
//

import SwiftUI

struct CustomCardView: View {
    var body: some View {
        VStack(spacing: 20) {
            Card {
                HStack {
                    Image(systemName: "star.fill")
                    
                    Text("Featured")
                }
            } content: {
                Text("This is customizable SwiftUI card")
            }
            
            FlipCard(
                front: Card {
                    HStack {
                        Image(systemName: "star.fill")
                        
                        Text("Front")
                    }
                } content: {
                    Text("This is customizable SwiftUI card front side")
                },
//                    .frame(width: 200, height: 120),
                back: Card {
                    HStack {
                        Image(systemName: "star.fill")
                        
                        Text("Back")
                    }
                } content: {
                    Text("This is customizable SwiftUI card back side")
                }
//                    .frame(width: 200, height: 120)
            )
            .glow()
            
            FlowLayout {
                ForEach(0..<10) { i in
                    Text("Item \(i)")
                        .padding()
                        .background(Color.gray.opacity(0.2))
                        .cornerRadius(8)
                        .glow()
                }
            }
        }
    }
}
