//
//  HomeViewModel.swift
//  News
//
//  Created by Muhammed Yılmaz on 3.07.2025.
//

import Foundation

class HomeViewModel {
    
    private let networkManager = NetworkManager()
        var articles: [Article] = []
        var onDataUpdated: (() -> Void)?

        func fetchArticles() {
            networkManager.fetchArticles { [weak self] result in
                switch result {
                case .success(let newsModel):
                    self?.articles = newsModel.articles
                    self?.onDataUpdated?()
                case .failure(let error):
                    print("Error fetching articles: \(error)")
                }
            }
        }
}
