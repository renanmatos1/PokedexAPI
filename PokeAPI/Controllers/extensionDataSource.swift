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
        let pokemonLeft = pokemonInfo!.results[indexPath.row * 2]
        let pokemonRight = pokemonInfo!.results[(indexPath.row * 2) + 1]
        

        pokemon.append(pokemonLeft)
        pokemon.append(pokemonRight)
        
    
        let tapLeft = PokemonGesture.init(target: self, action: #selector(tap))
        let tapRight = PokemonGesture.init(target: self, action: #selector(tap))
        
        
        cell.viewOne.addGestureRecognizer(tapLeft)
        cell.viewTwo.addGestureRecognizer(tapRight)
        
        
        tapLeft.addTarget(self, action: #selector(tap))
        tapLeft.pokemonName = pokemonLeft.name
        tapLeft.image = pokemon[0].imageURL
        tapLeft.idPokemon = pokemonLeft.idGetter()
        tapRight.addTarget(self, action: #selector(tap))
        tapRight.image = pokemon[1].imageURL
        tapRight.idPokemon = pokemonRight.idGetter()
        tapRight.pokemonName = pokemonRight.name
        
        
        cell.setupCell(pokemon: pokemon)
        
        return cell
    }
}


class PokemonGesture: UITapGestureRecognizer {
    
    var pokemonName: String?
    var idPokemon: String?
    var image: String?
    
}

