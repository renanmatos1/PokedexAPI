//
//  extensionDelegate.swift
//  PokeAPI
//
//  Created by Renan de Matos on 28/11/22.
//

import Foundation
import UIKit


extension HomeViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let storyboard = UIStoryboard(name: "DetailScreen", bundle: nil)
        
        let detailViewController = storyboard.instantiateViewController(withIdentifier: "secondScreen") as! DetailViewController
        
        
        
        self.navigationController?.pushViewController(detailViewController, animated: true)
    }
    
}
