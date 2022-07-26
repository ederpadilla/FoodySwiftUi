//
//  NetworkManager.swift
//  FoodySwiftUI
//
//  Created by Eder  Padilla on 25/07/22.
//

import Foundation

final class NetworkManager {
    
    static let shared = NetworkManager()
    
    private let baseUrl = "https://seanallen-course-backend.herokuapp.com/swiftui-fundamentals/"
    private let appetizerEndPoint = "appetizers"
    
    private init() {}
    
    func getFoodyes(completed: @escaping(Result<[Foody], FoodyError>) -> Void) {
        guard let url = URL(string: "\(baseUrl)\(appetizerEndPoint)") else { completed(.failure(.invalidURL)); return }
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, response, error in
            if error != nil {
                completed(.failure(.noInternet))
                return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200
            else { completed(.failure(.invalidResponse)); return }
            guard let data = data else { completed(.failure(.invalidData)); return }
            do {
                let decoder = JSONDecoder()
                let responseDecoded = try decoder.decode(FoodyResponse.self, from: data)
                completed(.success(responseDecoded.asFoody()))
            } catch {
                completed(.failure(.invalidData))
            }
        }
        task.resume()
    }
}
