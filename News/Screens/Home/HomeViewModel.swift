//
//  HomeViewModel.swift
//  News
//
//  Created by Muhammed Yılmaz on 3.07.2025.
//

import Foundation

class HomeViewModel {
    
    private let networkManager = NetworkManager()
    var newsModel: NewsModel?
    var articles: [Article] = []
    var onDataUpdated: () -> Void = {}
    
    func fetchArticles() {
        networkManager.fetchArticles { [weak self] result in
            switch result {
            case .success(let newsModel):
                self?.newsModel = newsModel
                self?.onDataUpdated()
            case .failure(let error):
                print("Error fetching articles: \(error)")
            }
            
        }
        
    }
}
