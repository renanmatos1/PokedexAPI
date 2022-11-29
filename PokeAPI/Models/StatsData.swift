//
//  StatsData.swift
//  PokeAPI
//
//  Created by Renan de Matos on 28/11/22.
//

import Foundation

struct StatsData: Codable {
    
    var baseStat: Int
    var stats: Stats
    
    enum CodingKeys: String, CodingKey {
        
        case baseStat = "base_stat"
        case stats = "stat"
    }
}
