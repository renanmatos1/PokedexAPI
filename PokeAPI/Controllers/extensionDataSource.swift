//
//  extensionDataSource.swift
//  PokeAPI
//
//  Created by Renan de Matos on 25/11/22.
//

import Foundation
import UIKit


extension HomeViewController: UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return (pokemonInfo?.results.count ?? 0) / 2
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! PokemonsTableViewCell
        
        
        var pokemon: [Pokemon] = []
        
        pokemon.append(pokemonInfo!.results[indexPath.row * 2])
        pokemon.append(pokemonInfo!.results[(indexPath.row * 2) + 1])
        
        cell.setupCell(pokemon: pokemon)
        
        return cell
    }
}

