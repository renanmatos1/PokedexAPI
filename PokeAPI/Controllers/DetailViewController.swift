//
//  DetailViewController.swift
//  PokeAPI
//
//  Created by Renan de Matos on 28/11/22.
//

import UIKit

class DetailViewController: UIViewController {
    
    var pokemon: PokemonStats?
    var id: String!
    var imagePokemon: String!
    
    
    @IBOutlet weak var namePokemonLabel: UILabel!
    @IBOutlet weak var imageViewPokemon: UIImageView!
    @IBOutlet weak var healthLabel: UILabel!
    @IBOutlet weak var attackLabel: UILabel!
    @IBOutlet weak var defenseLabel: UILabel!
    @IBOutlet weak var speedLabel: UILabel!
    
    @IBOutlet weak var healthValue: UILabel!
    @IBOutlet weak var attackValue: UILabel!
    @IBOutlet weak var defenseValue: UILabel!
    @IBOutlet weak var speedValue: UILabel!
        
    @IBOutlet weak var viewBackground: UIView!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        getInfoPokemons()
        setupPokemonDetail()
    }
    

    func setupPokemonDetail(){
        
        viewBackground.layer.cornerRadius = 12
        viewBackground.layer.masksToBounds = true
    }
    
    
    func getInfoPokemons() {

        let url = URL(string: "https://pokeapi.co/api/v2/pokemon/\(id ?? "")")
            
            if let url = url {
                
                var request = URLRequest(url: url)
                
                request.httpMethod = "GET"
                request.addValue("aplication/json", forHTTPHeaderField: "Content-Type")
                
                let session = URLSession.shared
                
                let task = session.dataTask(with: request) { data, response, error in
                    if let data = data, error == nil {
                        
                        do {
                            
                            let decoder = JSONDecoder()
                            let pokemon = try decoder.decode(PokemonStats.self, from: data)
                            
                            self.pokemon = pokemon
                            
                            print(pokemon)
                            
                            DispatchQueue.main.async {
                                
                                self.namePokemonLabel.text = pokemon.name.capitalized
                                self.healthValue.text = String(pokemon.stats[0].baseStat)
                                self.attackValue.text = String(pokemon.stats[1].baseStat)
                                self.defenseValue.text = String(pokemon.stats[2].baseStat)
                                self.speedValue.text = String(pokemon.stats[5].baseStat)
                                self.imageViewPokemon.loadFrom(UrlAddress: self.imagePokemon)
                                
                            }
                            
                        } catch let error {

                            
                            print(String(describing: error))
                        }
                    }
                }
            task.resume()
        }
    }

}
