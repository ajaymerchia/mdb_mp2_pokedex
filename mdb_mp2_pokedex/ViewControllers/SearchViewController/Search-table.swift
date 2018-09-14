//
//  Search-table.swift
//  mdb_mp2_pokedex
//
//  Created by Ajay Raj Merchia on 9/14/18.
//  Copyright © 2018 Ajay Raj Merchia. All rights reserved.
//

import Foundation
import UIKit

extension SearchViewController: UITableViewDataSource, UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pokemonResults.count
    }
    
    // Setting up cells
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "pokemonRow") as! PokemonRow
        for subview in cell.contentView.subviews {
            subview.removeFromSuperview()
        }
        
        cell.awakeFromNib()
        
        let curr_pokemon = pokemonResults[indexPath.row]
        
        cell.pokemon_name.text = curr_pokemon.name
        
        cell.pokemon_name.text = "#\(curr_pokemon.number!) " + cell.pokemon_name.text!
        
        if let imageUrl:URL = URL(string: curr_pokemon.imageUrl) {
            DispatchQueue.global().async {
                
                let data = try? Data(contentsOf: imageUrl)
                DispatchQueue.main.async {
                    if let retrievedImage = data {
                        cell.pokemon_image.image = UIImage(data: retrievedImage)
                    }
                    else {
                        cell.pokemon_image.image = #imageLiteral(resourceName: "pokeball")
                    }
                }
                
            }
        } else {
            cell.pokemon_image.image = #imageLiteral(resourceName: "pokeball")
        }
        

        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        targetPokemon = pokemonResults[indexPath.row]
        performSegue(withIdentifier: "showProfileView", sender: self)
    }
    
}
