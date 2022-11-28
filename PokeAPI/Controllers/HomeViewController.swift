//
//  ViewController.swift
//  PokeAPI
//
//  Created by Renan de Matos on 25/11/22.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var pokemonInfo: PokemonJson?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Pokedex"
        getPokemonsApi()
        self.tableView.dataSource = self

    }

    func getPokemonsApi() {

            let url = URL(string: "https://pokeapi.co/api/v2/pokemon?limit=100")
            
            if let url = url {
                
                var request = URLRequest(url: url)
                
                request.httpMethod = "GET"
                request.addValue("aplication/json", forHTTPHeaderField: "Content-Type")
                
                let session = URLSession.shared
                
                let task = session.dataTask(with: request) { data, response, error in
                    if let data = data, error == nil {
                        
                        do {
                            let decoder = JSONDecoder()
                            let pokemon = try decoder.decode(PokemonJson.self, from: data)
                            self.pokemonInfo = pokemon
                            
                            DispatchQueue.main.async {
                                
                                self.tableView.reloadData()
//                                print(pokemon)
                            }
                            
                        } catch let error {
                            print(error.localizedDescription)
                        }
                    }
                }
            task.resume()
        }
    }
}

