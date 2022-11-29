//
//  pokemonStats.swift
//  PokeAPI
//
//  Created by Renan de Matos on 28/11/22.
//

import Foundation

struct PokemonStats: Codable {
    
    var id: Int
    var name: String
    var stats: [StatsData]
    
    
}
