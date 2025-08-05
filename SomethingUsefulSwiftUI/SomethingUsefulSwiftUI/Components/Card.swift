//
//  Card.swift
//  SomethingUsefulSwiftUI
//
//  Created by Gordon Choi on 8/5/25.
//

import SwiftUI

// 이건 첫번째 레슨, 재사용 가능한 뷰 분리하기
struct Card<Header: View, Content: View>: View {
    let header: () -> Header
    let content: () -> Content
    
    // 이건 두번째 레슨, @ViewBuilder 활용해서 nested layout 유연하게 처리하기
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
