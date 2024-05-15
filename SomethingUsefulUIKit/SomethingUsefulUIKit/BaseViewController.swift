//
//  BaseViewController.swift
//  SomethingUsefulUIKit
//
//  Created by Gordon Choi on 5/15/24.
//

import UIKit

class BaseViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupSubviews()
        setupConstraints()
        bindWithViewModel()
    }
    
    func setupSubviews() { }
    func setupConstraints() { }
    func bindWithViewModel() { }
}
