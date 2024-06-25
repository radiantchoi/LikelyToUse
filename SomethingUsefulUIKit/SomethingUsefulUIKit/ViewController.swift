//
//  ViewController.swift
//  SomethingUsefulUIKit
//
//  Created by Gordon Choi on 5/7/24.
//

import UIKit

import Lottie

final class ViewController: BaseViewController {
    private lazy var lottieAnimatedView: LottieAnimationView = {
        $0.loopMode = .loop
        $0.animationSpeed = 2
        $0.backgroundColor = .clear
        
        return $0
    }(LottieAnimationView(name: "Wave"))
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func setupSubviews() {
        view.addSubview(lottieAnimatedView)
        
        lottieAnimatedView.play()
    }
    
    override func setupConstraints() {
        lottieAnimatedView.translatesAutoresizingMaskIntoConstraints = false
        
        lottieAnimatedView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        lottieAnimatedView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
}

