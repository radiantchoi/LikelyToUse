//
//  ContentView.swift
//  SomethingUsefulSwiftUI
//
//  Created by Gordon Choi on 5/7/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            List(ViewDojo.allCases) { example in
                Section("View Components") {
                    NavigationLink(example.name, value: example)
                }
            }
        }
        .navigationDestination(for: ViewDojo.self) { component in
            switch component {
            case .customDropdown:
                CustomDropdownView()
            }
        }
    }
}

#Preview {
    ContentView()
}
