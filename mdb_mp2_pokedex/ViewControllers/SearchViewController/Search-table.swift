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
    
    // Sets the number of cells to be created
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pokemonResults.count
    }
    
    
    /// Generates the cells to be used
    ///
    /// - Parameters:
    ///   - tableView: tableview holding cells
    ///   - indexPath: index of the cell to be created
    /// - Returns: row holding pokemon
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Clean up reusable cell
        let cell = tableView.dequeueReusableCell(withIdentifier: "pokemonRow") as! PokemonRow
        for subview in cell.contentView.subviews {
            subview.removeFromSuperview()
        }
        
        // Initialize Cell
        cell.awakeFromNib()
        let curr_pokemon = pokemonResults[indexPath.row]
        
        // Set name & image
        cell.pokemon_name.text = curr_pokemon.name
        cell.pokemon_name.text = "#\(curr_pokemon.number!) " + (cell.pokemon_name.text?.replacingOccurrences(of: "( ", with: "(").replacingOccurrences(of: " )", with: ")".replacingOccurrences(of: "  ", with: " ")))!
        
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
    
    // If a row is tapped, transition to the profile for that pokemon
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        targetPokemon = pokemonResults[indexPath.row]
        performSegue(withIdentifier: "showProfileView", sender: self)
        tableView.deselectRow(at: indexPath, animated: true)
        
    }
    
    // If Segueing to Profile, set the profile accordingly
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let profileVC = segue.destination as? ProfileViewController {
            profileVC.pokemonProfile = targetPokemon
        }
    }
    
}
