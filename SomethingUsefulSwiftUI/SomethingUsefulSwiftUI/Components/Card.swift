//
//  Card.swift
//  SomethingUsefulSwiftUI
//
//  Created by Gordon Choi on 8/5/25.
//

import SwiftUI

struct Card<Header: View, Content: View>: View {
    let header: () -> Header
    let content: () -> Content
    
    init(
        @ViewBuilder header: @escaping () -> Header,
        @ViewBuilder content: @escaping () -> Content
    ) {
        self.header = header
        self.content = content
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            header()
                .font(.headline)
            
            content()
        }
        .padding()
        .background(Color(.secondarySystemBackground))
        .cornerRadius(16)
        .shadow(radius: 4)
    }
}
