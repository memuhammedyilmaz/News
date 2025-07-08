//
//  NewsModel.swift
//  News
//
//  Created by Muhammed Yılmaz on 3.07.2025.
//

import Foundation

// MARK: - Welcome
struct NewsModel: Codable {
    let articles: [Article]
}

// MARK: - Article
struct Article: Codable {
    let author: String?
    let title: String?
    let description: String?
    let url: String?
    let urlToImage: String?
    let publishedAt: String?
    let content: String?
}

