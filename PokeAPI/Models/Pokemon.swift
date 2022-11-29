//
//  Pokedex.swift
//  PokeAPI
//
//  Created by Renan de Matos on 25/11/22.
//

import Foundation


struct Pokemon: Codable {
    
    var name: String
    var url: String
    var imageURL: String {
        
        let imgUrl = "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/"
        
        return imgUrl + idGetter() + ".png"
    
    }
    
    enum CodingKeys: CodingKey {
        
        case name
        case url
        
    }
    
    func idGetter() -> String {
        
        var id: String = ""
        var numberOfBars: Int = 0
        
        for char in url.reversed() {
            
            if char == "/" {
                
                numberOfBars += 1
            }
            
            if char != "/" && numberOfBars == 1 {
                
                id += String(char)
            }
            
            if numberOfBars == 2 {
                break
            }
            
        }
        
        return String(id.reversed())
    }
}

