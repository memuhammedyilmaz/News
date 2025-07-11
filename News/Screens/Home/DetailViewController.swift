//
//  DetailViewController.swift
//  News
//
//  Created by Muhammed Yılmaz on 11.07.2025.
//

import UIKit
import SnapKit
import Kingfisher

class DetailViewController: UIViewController {

    private var article: Article
  
    private let ImageView: UIImageView = {
       let image = UIImageView()
        image.image = UIImage(systemName: "photo")
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        return image
    }()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = .preferredFont(forTextStyle: .body)
        label.textColor = .label
        label.numberOfLines = 0
        return label
    }()
    
    init(article: Article) {
            self.article = article
            super.init(nibName: nil, bundle: nil)
        }

        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureView()
    }
    
}



private extension DetailViewController {
    func configureView() {
        view.backgroundColor = .systemBackground
        addViews()
        configureLayout()
        
        title = article.title
        
        if let url = URL(string: article.urlToImage ?? "") {
            ImageView.kf.setImage(with: url)
        } else {
            ImageView.image = UIImage(systemName: "photo")
        }
        descriptionLabel.text = article.description ?? "No description available."
    }
    
    func addViews() {
        view.addSubview(ImageView)
        view.addSubview(descriptionLabel)
    }
    
    func configureLayout() {
       
        
        ImageView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(16)
            make.leading.trailing.equalToSuperview().inset(16)
            make.height.equalTo(300)
        }
        
        descriptionLabel.snp.makeConstraints { make in
            make.top.equalTo(ImageView.snp.bottom).offset(16)
            make.leading.trailing.equalToSuperview().inset(16)
        }
    }
}

