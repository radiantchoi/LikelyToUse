//
//  CustomCardView.swift
//  SomethingUsefulSwiftUI
//
//  Created by Gordon Choi on 8/5/25.
//

import SwiftUI

struct CustomCardView: View {
    var body: some View {
        Card {
            HStack {
                Image(systemName: "star.fill")
                Text("Featured")
            }
        } content: {
            Text("This is customizable SwiftUI card")
        }
    }
}
