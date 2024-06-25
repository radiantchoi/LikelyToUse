//
//  ViewController.swift
//  SomethingUsefulUIKit
//
//  Created by Gordon Choi on 5/7/24.
//

import UIKit

import Lottie

final class ViewController: BaseViewController {
    private lazy var helloLabel: UILabel = {
        let label = UILabel()
        
        label.text = "Hello"
        return label
    }()
    
    private lazy var lottieAnimatedView: LottieAnimationView = {
        $0.loopMode = .loop
        $0.animationSpeed = 2
        $0.backgroundColor = .clear
        
        return $0
    }(LottieAnimationView(name: "Wave"))
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // 이런 식으로 쓸 때 super를 해 주어야 할까?
    override func setupSubviews() {
        view.addSubview(helloLabel)
        view.addSubview(lottieAnimatedView)
        
        lottieAnimatedView.play()
    }
    
    override func setupConstraints() {
        helloLabel.translatesAutoresizingMaskIntoConstraints = false
        lottieAnimatedView.translatesAutoresizingMaskIntoConstraints = false
        
        helloLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        helloLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        lottieAnimatedView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        lottieAnimatedView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
}

