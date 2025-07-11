//
//  SkeletonCell.swift
//  News
//
//  Created by Muhammed Yılmaz on 11.07.2025.
//

import UIKit
import SnapKit

class SkeletonCell: UITableViewCell {
    static let identifier = "SkeletonCell"

    private let skeletonImageView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.lightGray.withAlphaComponent(0.5)
        view.layer.cornerRadius = 8
        return view
    }()
    
    private let skeletonTitleView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.lightGray.withAlphaComponent(0.5)
        view.layer.cornerRadius = 4
        return view
    }()
    
    private let skeletonAuthorView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.lightGray.withAlphaComponent(0.5)
        view.layer.cornerRadius = 4
        return view
    }()
    
    private let skeletonDateView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.lightGray.withAlphaComponent(0.5)
        view.layer.cornerRadius = 4
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension SkeletonCell {
    func configureView() {
        addViews()
        configureLayout()
    }
    
    func addViews() {
        contentView.addSubview(skeletonImageView)
        contentView.addSubview(skeletonTitleView)
        contentView.addSubview(skeletonAuthorView)
        contentView.addSubview(skeletonDateView)
    }
    
    func configureLayout() {
        skeletonImageView.snp.makeConstraints {
            $0.top.leading.equalToSuperview().offset(16)
            $0.width.height.equalTo(140)
        }
        
        skeletonTitleView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(16)
            $0.leading.equalTo(skeletonImageView.snp.trailing).offset(12)
            $0.trailing.equalToSuperview().offset(-16)
            $0.height.equalTo(24)
        }
       
        skeletonAuthorView.snp.makeConstraints {
            $0.top.equalTo(skeletonTitleView.snp.bottom).offset(12)
            $0.leading.equalTo(skeletonImageView.snp.trailing).offset(12)
            $0.trailing.equalToSuperview().offset(-16)
            $0.height.equalTo(24)
        }
        
        skeletonDateView.snp.makeConstraints {
            $0.leading.equalTo(skeletonImageView.snp.trailing).offset(12)
            $0.top.equalTo(skeletonAuthorView.snp.bottom).offset(12)
            $0.trailing.equalToSuperview().offset(-16)
            $0.height.equalTo(24)
        }
    }
    
}
