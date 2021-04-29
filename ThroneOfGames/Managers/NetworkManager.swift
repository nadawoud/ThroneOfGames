//
//  NetworkManager.swift
//  ThroneOfGames
//
//  Created by Nada Yehia Dawoud on 24/04/2021.
//

import UIKit

class NetworkManager {
    
    static let shared = NetworkManager()
    private let baseURL = "https://api.rawg.io"
    private let apiKey = "a06bea7918494ac5b1eae4c9557ae0df"
    let cache = NSCache<NSString, UIImage>()
    
    
    func getGames(page: Int, completed: @escaping (Result<GamesData, TOGError>) -> Void) {
        let endpoint = baseURL + "/api/games?page_size=10&page=\(page)&key=\(apiKey)"
        
        guard let url = URL(string: endpoint) else {
            completed(.failure(.incorrectURL))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let _ = error {
                completed(.failure(.noInternetConnection))
                return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completed(.failure(.invalidServerResponse))
                return
            }
            
            guard let data = data else {
                completed(.failure(.noData))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let gamesData = try decoder.decode(GamesData.self, from: data)
                completed(.success(gamesData))
            } catch {
                completed(.failure(.invalidData))
            }
        }
        
        task.resume()
    }
}
