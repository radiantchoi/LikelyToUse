//
//  CustomDropdownView.swift
//  SomethingUsefulSwiftUI
//
//  Created by Gordon Choi on 5/7/24.
//

import SwiftUI

struct CustomDropdownView: View {
    @State private var selectedOptionIndex: Int = 0
    @State private var showDropdown: Bool = false
    
    var body: some View {
        CustomizableDropdown(
            options: ["Robin", "Firefly", "Jade"],
            layoutOptions: CustomizableDropdownLayoutOptions(
                menuWidth: 200,
                buttonHeight: 50,
                maximumItemDisplayed: 3
            ),
            selectedOptionIndex: $selectedOptionIndex,
            showDropdown: $showDropdown
        )
    }
}

#Preview {
    CustomDropdownView()
}
