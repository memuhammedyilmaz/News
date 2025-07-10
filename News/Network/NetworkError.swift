//
//  NetworkError.swift
//  News
//
//  Created by Muhammed Yılmaz on 8.07.2025.
//

import Foundation

class NetworkError: Error {
    enum ErrorType: Error {
        case decodingError
        case networkError
        case serverError
        case unknownError
        case invalidURL
    }
}
