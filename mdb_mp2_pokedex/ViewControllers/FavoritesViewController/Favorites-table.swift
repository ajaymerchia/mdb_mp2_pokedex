//
//  Favorites-table.swift
//  mdb_mp2_pokedex
//
//  Created by Ajay Raj Merchia on 9/14/18.
//  Copyright © 2018 Ajay Raj Merchia. All rights reserved.
//

import Foundation
import UIKit
extension FavoritesViewController: UITableViewDelegate, UITableViewDataSource {
    
    
    /// How many Tables Cells to create
    ///
    /// - Parameters:
    ///   - tableView: internal behavior
    ///   - section: internal behavior
    /// - Returns: how many tables cells to create
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return favorites_from_storage.count
    }
    
    
    /// Pattern for creating table cells
    ///
    /// - Parameters:
    ///   - tableView: TableView to which to add the cell
    ///   - indexPath: index of the Cell
    /// - Returns: Table Cell for the indexed Pokemon
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Clean up cell
        let cell = tableView.dequeueReusableCell(withIdentifier: "pokemonRow") as! PokemonRow
        for subview in cell.contentView.subviews {
            subview.removeFromSuperview()
        }
        
        // Initialize Cell and Data
        cell.awakeFromNib()
        let curr_pokemon = PokemonGenerator.ALL_POKEMON[favorites_from_storage[indexPath.row]]
        
        // Append cleaned version of name to the pokemon's number
        cell.pokemon_name.text = "#\(curr_pokemon.number!) " + (cell.pokemon_name.text?.replacingOccurrences(of: "( ", with: "(").replacingOccurrences(of: " )", with: ")".replacingOccurrences(of: "  ", with: " ")))!
        
        // Get ImageURL and assign to cell
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
    
    
    
    
    ///  If a pokemon is tapped, prepare for the Segue
    ///
    /// - Parameters:
    ///   - tableView: tableView on which one was tapped
    ///   - indexPath: index of the tapped pokemon
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        targetPokemon = PokemonGenerator.ALL_POKEMON[favorites_from_storage[indexPath.row]]
        performSegue(withIdentifier: "Fav2Profile", sender: self)
        tableView.deselectRow(at: indexPath, animated: true)

    }
    
    
    /// If a pokemon is selected, initialize the profile view with this Pokemon
    ///
    /// - Parameters:
    ///   - segue: segue to the profile view
    ///   - sender: src of tap
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let profileVC = segue.destination as! ProfileViewController
        profileVC.pokemonProfile = targetPokemon
    }
}
