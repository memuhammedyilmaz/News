//
//  SplashViewController.swift
//  News
//
//  Created by Muhammed Yılmaz on 1.07.2025.
//

import UIKit
import SnapKit

class SplashViewController: UIViewController {

    private let iconImage: UIImageView =  {
       let imageView = UIImageView()
        imageView.image = UIImage(systemName: "newspaper.fill")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let newsLabel: UILabel = {
       let label = UILabel()
        label.text = "Smith News"
        label.textColor = .label
        label.font = .systemFont(ofSize: 32, weight: .bold)
        label.textAlignment = .center
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
        navigationToTabBar()
    }
}

extension SplashViewController {
    func configureView() {
        view.backgroundColor = .systemBackground
        addViews()
        configureLayout()
    }
    
    func addViews() {
        view.addSubview(iconImage)
        view.addSubview(newsLabel)
    }
    
    func configureLayout() {
        iconImage.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.width.height.equalTo(216)
        }
        
        newsLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(iconImage.snp.bottom).offset(16)
        }
    }
    
    func navigationToTabBar() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0 ) {
            guard let sceneDelegate = UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate else {
                return
            }
            let tabBarController = TabBarController()
            sceneDelegate.window?.rootViewController = tabBarController
        }
    }
}

#Preview {
    SplashViewController()
}
