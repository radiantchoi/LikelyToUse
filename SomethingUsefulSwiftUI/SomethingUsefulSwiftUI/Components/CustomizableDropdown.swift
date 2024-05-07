//
//  CustomizableDropdown.swift
//  SomethingUsefulSwiftUI
//
//  Created by Gordon Choi on 5/7/24.
//

import SwiftUI

struct CustomizableDropdownLayoutOptions {
    let menuWidth: CGFloat
    let buttonHeight: CGFloat
    let maximumItemDisplayed: Int
}

struct CustomizableDropdown: View {
    private let options: [String]
    private var menuWidth: CGFloat
    private var buttonHeight: CGFloat
    private var maximumItemDisplayed: Int
    
    @Binding var selectedOptionIndex: Int
    @Binding var showDropdown: Bool
    
    @State private var scrollPosition: Int?
    
    init(
        options: [String],
        layoutOptions: CustomizableDropdownLayoutOptions,
        selectedOptionIndex: Binding<Int>,
        showDropdown: Binding<Bool>
    ) {
        self.options = options
        self.menuWidth = layoutOptions.menuWidth
        self.buttonHeight = layoutOptions.buttonHeight
        self.maximumItemDisplayed = layoutOptions.maximumItemDisplayed
        self._selectedOptionIndex = selectedOptionIndex
        self._showDropdown = showDropdown
    }
    
    var body: some View {
        VStack {
            VStack(spacing: 0) {
                Button {
                    withAnimation {
                        showDropdown.toggle()
                    }
                } label: {
                    HStack(spacing: nil) {
                        Text(options[selectedOptionIndex])
                        
                        Spacer()
                        
                        Image(systemName: "chevron.down")
                            .rotationEffect(.degrees(showDropdown ? -180 : 0))
                    }
                }
                .padding(.horizontal, 20)
                .frame(width: menuWidth, height: buttonHeight, alignment: .leading)
                
                if showDropdown {
                    let scrollViewHeight: CGFloat = options.count > maximumItemDisplayed
                    ? buttonHeight * CGFloat(maximumItemDisplayed)
                    : buttonHeight * CGFloat(options.count)
                    
                    ScrollView {
                        ForEach(0..<options.count, id: \.self) { index in
                            Button {
                                withAnimation {
                                    selectedOptionIndex = index
                                    showDropdown.toggle()
                                }
                            } label: {
                                HStack {
                                    Text(options[index])
                                    
                                    Spacer()
                                    
                                    if index == selectedOptionIndex {
                                        Image(systemName: "checkmark.circle.fill")
                                    }
                                }
                            }
                            .padding(.horizontal, 20)
                            .frame(width: menuWidth, height: buttonHeight, alignment: .leading)
                        }
                        .scrollTargetLayout()
                    }
                    .scrollPosition(id: $scrollPosition)
                    .scrollDisabled(options.count < maximumItemDisplayed)
                    .frame(height: scrollViewHeight)
                    .onAppear {
                        scrollPosition = selectedOptionIndex
                    }
                }
            }
            .foregroundStyle(Color.white)
            .background(
                RoundedRectangle(cornerRadius: 15)
                    .fill(Color.black)
            )
        }
        .frame(width: menuWidth, height: buttonHeight, alignment: .top)
        .zIndex(100)
    }
}
