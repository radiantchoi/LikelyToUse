//
//  ViewDojo.swift
//  SomethingUsefulSwiftUI
//
//  Created by Gordon Choi on 5/7/24.
//

enum ViewDojo: String, CaseIterable, Identifiable {
    case customDropdown
    
    var id: String {
        return rawValue
    }
    
    var name: String {
        switch self {
        case .customDropdown:
            return "Custom Dropdown Menu"
        }
    }
}
