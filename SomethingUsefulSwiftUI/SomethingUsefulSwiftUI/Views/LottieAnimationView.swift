//
//  LottieAnimationView.swift
//  SomethingUsefulSwiftUI
//
//  Created by Gordon Choi on 6/25/24.
//

import SwiftUI

import Lottie

struct LottieAnimationView: View {
    var body: some View {
        LottieView(animation: .named("RoundedCheckmark"))
            .looping()
    }
}

#Preview {
    LottieAnimationView()
}
