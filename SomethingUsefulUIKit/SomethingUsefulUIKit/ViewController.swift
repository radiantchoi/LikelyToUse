//
//  ViewController.swift
//  SomethingUsefulUIKit
//
//  Created by Gordon Choi on 5/7/24.
//

import UIKit

final class ViewController: BaseViewController {
    private lazy var helloLabel: UILabel = {
        let label = UILabel()
        
        label.text = "Hello"
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // 이런 식으로 쓸 때 super를 해 주어야 할까?
    override func setupSubviews() {
        view.addSubview(helloLabel)
    }
    
    override func setupConstraints() {
        helloLabel.translatesAutoresizingMaskIntoConstraints = false
        
        helloLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        helloLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
}

