//
//  FlowLayout.swift
//  SomethingUsefulSwiftUI
//
//  Created by Gordon Choi on 8/5/25.
//

import SwiftUI

// 드디어 세 번째 레슨, 레이아웃 커스텀하기
struct FlowLayout: Layout {
    func sizeThatFits(proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) -> CGSize {
        var width: CGFloat = 0
        var height: CGFloat = 0
        let spacing: CGFloat = 8
        let maxWidth: CGFloat = proposal.width ?? .infinity
        var rowHeight: CGFloat = 0
        
        // 각 줄마다 있는 자식 뷰의 크기를 먼저 잰다.
        // 실제로는 엣지 케이스 핸들링도 필요하다.
        for subview in subviews {
            let size = subview.sizeThatFits(.unspecified)
            
            if width + size.width + spacing > maxWidth {
                height += rowHeight + spacing
                width = 0
                rowHeight = 0
            }
            
            width = size.width + spacing
            rowHeight = max(rowHeight, size.height)
        }
        
        height += rowHeight
        
        return CGSize(width: maxWidth, height: height)
    }
    
    func placeSubviews(in bounds: CGRect, proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) {
        var x: CGFloat = 0
        var y: CGFloat = 0
        let spacing: CGFloat = 8
        let maxWidth = bounds.width
        var rowHeight: CGFloat = 0
        
        for subview in subviews {
            let size = subview.sizeThatFits(.unspecified)
            
            if x + size.width + spacing > maxWidth {
                y += rowHeight + spacing
                x = 0
                rowHeight = 0
            }
            
            subview.place(at: CGPoint(x: x, y: y), proposal: ProposedViewSize(width: size.width, height: size.height))
            x += size.width + spacing
            rowHeight = max(rowHeight, size.height)
        }
    }
}
