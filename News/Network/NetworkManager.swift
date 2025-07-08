//
//  NetworkManager.swift
//  News
//
//  Created by Muhammed Yılmaz on 3.07.2025.
//

import Foundation

class NetworkManager {
    
    func fetchUser() {
        guard let url = URL(string: baseUrl) else {
            print("Invalid URL")
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print(error.localizedDescription)
            }
            
            guard let data = data else {
                print("No data received")
                return
            }
            
            do {
                let newsModel = try JSONDecoder().decode(NewsModel.self, from: data)
                print(newsModel)
            } catch {
                print("Decoding error: \(error.localizedDescription)")
            }
        }
            task.resume()
    }
}


