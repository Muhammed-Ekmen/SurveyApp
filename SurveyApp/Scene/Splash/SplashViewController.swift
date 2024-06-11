//
//  SplashViewController.swift
//  SurveyApp
//
//  Created by kingSemih on 11.06.2024.
//

import UIKit
import TinyConstraints
import UIComponents
import Lottie

final class SplashViewController: BaseViewController<SplashViewModel> {
    
    private let loadingLottie = LottieAnimationView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        config()
        addSubviews()
        viewModel.didLoad()
    }
    
}


//  MARK: - Config
extension SplashViewController{
    
    private func config(){
        configView()
        configLottie()
    }
    
    private func configView(){
        self.view.backgroundColor = .white
    }
    
    private func configLottie(){
        loadingLottie.animation = LottieAnimation.named("Loading")
        loadingLottie.size(CGSize(width: 150, height: 150))
        loadingLottie.animationSpeed = 2
        loadingLottie.translatesAutoresizingMaskIntoConstraints = false
        loadingLottie.loopMode = .loop
        loadingLottie.contentMode = .scaleAspectFit
        loadingLottie.play()
    }
    
}


//  MARK: - Setup UI
extension SplashViewController{
    
    private func addSubviews(){
        addLoadingLottie()
    }
    
    private func addLoadingLottie(){
        view.addSubview(loadingLottie)
        loadingLottie.centerInSuperview()
    }
    
}

