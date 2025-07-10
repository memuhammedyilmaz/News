//
//  NetworkManager.swift
//  News
//
//  Created by Muhammed Yılmaz on 3.07.2025.
//

import Foundation

class NetworkManager {
    
    func fetchArticles(completion: @escaping (Result<NewsModel, Error>) -> Void) {
        guard let url = URL(string: baseUrl) else {
            completion(.failure(NetworkError.ErrorType.invalidURL))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(NetworkError.ErrorType.networkError))
                return
            }
            guard let data = data else {
                completion(.failure(NetworkError.ErrorType.unknownError))
                return
            }
            
            do {
                let newsModel = try JSONDecoder().decode(NewsModel.self, from: data)
                completion(.success(newsModel))
            } catch {
                completion(.failure(NetworkError.ErrorType.decodingError))
            }
        }
        task.resume()
       
    }
}


