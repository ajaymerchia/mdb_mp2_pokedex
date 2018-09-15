//
//  Search-grid.swift
//  mdb_mp2_pokedex
//
//  Created by Ajay Raj Merchia on 9/14/18.
//  Copyright © 2018 Ajay Raj Merchia. All rights reserved.
//

import Foundation
import UIKit

extension SearchViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    /// Returns number of cells to generate
    ///
    /// - Parameters:
    ///   - collectionView: collection view for the cells
    ///   - section: internal usage
    /// - Returns: Number of cells to create
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pokemonResults.count
    }
    
    
    /// Size of each pokemon in the grid
    ///
    /// - Parameters:
    ///   - collectionView: internal
    ///   - collectionViewLayout: internal
    ///   - indexPath: internal
    /// - Returns: Size for the collection cells
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        
        return CGSize(width: view.frame.width/4, height: view.frame.height/5)
        
    }
    
    
    /// Pattern for creating the used cells
    ///
    /// - Parameters:
    ///   - collectionView: collection to add this cell to
    ///   - indexPath: index of Cell
    /// - Returns: Cell Containing Pokemon information
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        // Clean up resuable cell
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "pokemonCell", for: indexPath) as! PokemonCell
        for subview in cell.contentView.subviews {
            subview.removeFromSuperview()
        }
        
        // Initialize Cell & Data
        let curr_pokemon = pokemonResults[indexPath.row]
        cell.awakeFromNib()
        
        // Clean up Pokemon Name
        var name = curr_pokemon.name!
        if name.contains(" ") {
            name = String(name.prefix(upTo: name.index(of: " ")!))
        }
        
        while (name.contains("%")) {
            var index = name.index(of: "%")
            index = name.index(name.index(of: "%")!, offsetBy: -2)
            name = String(name.prefix(upTo: index!))
        }
        cell.pokemon_name.text = name
    
        // Fetch image for pokemon
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
    
    
    /// Go to profile if pokemon tapped
    ///
    /// - Parameters:
    ///   - collectionView: collection view holding the pokemon
    ///   - indexPath: index of the cell clicked
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        targetPokemon = pokemonResults[indexPath.row]
        performSegue(withIdentifier: "showProfileView", sender: self)
    }
    
    
    
    
}
