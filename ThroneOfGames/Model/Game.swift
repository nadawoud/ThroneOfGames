//
//  Game.swift
//  ThroneOfGames
//
//  Created by Nada Yehia Dawoud on 27/04/2021.
//

import Foundation

struct GamesData: Codable {
    let next: String?
    let previous: String?
    let results: [Game]
}

struct Game: Codable {
    let id: Int
    let name: String
    let metacritic: Int
    let backgroundImage: String
    let genres: [Genre]
    
    struct Genre: Codable {
        let name: String
    }
}
