//
//  DetailViewController.swift
//  PokeAPI
//
//  Created by Renan de Matos on 28/11/22.
//

import UIKit

class DetailViewController: UIViewController {
    
    var pokemon: [Pokemon] = []
    
    
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

        setupPokemonDetail()
        
    }
    
    
    func setupPokemonDetail(){
        
        viewBackground.layer.cornerRadius = 12
        viewBackground.layer.masksToBounds = true
        
    }
    

}
