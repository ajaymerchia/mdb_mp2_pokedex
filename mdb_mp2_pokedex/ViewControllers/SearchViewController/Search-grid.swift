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
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pokemonResults.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        
        return CGSize(width: view.frame.width/4, height: view.frame.height/5)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "pokemonCell", for: indexPath) as! PokemonCell
        
        for subview in cell.contentView.subviews {
            subview.removeFromSuperview()
        }
        
        let curr_pokemon = pokemonResults[indexPath.row]
        
        cell.awakeFromNib()
        
        // FIXME
        
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
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        targetPokemon = pokemonResults[indexPath.row]
        performSegue(withIdentifier: "showProfileView", sender: self)
    }
    
    
    
    
}
