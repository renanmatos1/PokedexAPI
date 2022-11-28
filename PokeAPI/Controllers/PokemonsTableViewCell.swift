//
//  PokemonsTableViewCell.swift
//  PokeAPI
//
//  Created by Renan de Matos on 25/11/22.
//

import UIKit

class PokemonsTableViewCell: UITableViewCell {

    @IBOutlet weak var imagePokemonOne: UIImageView!
    @IBOutlet weak var nameLabelPokemonOne: UILabel!
    @IBOutlet weak var nameLabelPokemonTwo: UILabel!
    @IBOutlet weak var imagePokemonTwo: UIImageView!
    
    @IBOutlet weak var viewOne: PokemonsTableViewCell!
    @IBOutlet weak var viewTwo: PokemonsTableViewCell!
    
    
    func setupCell(pokemon: [Pokemon]) {
        
        nameLabelPokemonOne.text = pokemon[0].name.capitalized
        imagePokemonOne.loadFrom(UrlAddress: pokemon[0].imageURL)
        nameLabelPokemonTwo.text = pokemon[1].name.capitalized
        imagePokemonTwo.loadFrom(UrlAddress: pokemon[1].imageURL)
        
        viewOne.layer.cornerRadius = 24
        viewTwo.layer.cornerRadius = 24
        viewOne.layer.masksToBounds = true
        viewTwo.layer.masksToBounds = true
    }
    
}

extension UIImageView {
    
    func loadFrom(UrlAddress: String) {
        
        guard let url = URL(string: UrlAddress) else {return}

        DispatchQueue.global().async {
            let imageData = try? Data(contentsOf: url)
            DispatchQueue.main.async { [weak self] in
                if let imageData = imageData {
                    if let loadedImage = UIImage(data: imageData) {
                        self?.image = loadedImage
                    }
                }
            }
        }
    }
}
