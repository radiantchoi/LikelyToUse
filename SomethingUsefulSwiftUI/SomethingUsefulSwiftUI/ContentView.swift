//
//  ContentView.swift
//  SomethingUsefulSwiftUI
//
//  Created by Gordon Choi on 5/7/24.
//

import OSLog
import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            List(ViewDojo.allCases) { example in
                NavigationLink(example.name, value: example)
            }
            .navigationTitle("View Components")
            .navigationDestination(for: ViewDojo.self) { component in
                switch component {
                case .customDropdown:
                    CustomDropdownView()
                case .lottieAnimation:
                    LottieAnimationView()
                case .customCard:
                    CustomCardView()
                }
            }
        }
        .onAppear {
            VividLogger.viewCycleLog(.warning, "View Appeared")
        }
    }
}

#Preview {
    ContentView()
}
