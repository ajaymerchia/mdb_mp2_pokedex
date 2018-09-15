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
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return favorites_from_storage.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "pokemonRow") as! PokemonRow
        for subview in cell.contentView.subviews {
            subview.removeFromSuperview()
        }
        
        cell.awakeFromNib()
        
        let curr_pokemon = PokemonGenerator.ALL_POKEMON[favorites_from_storage[indexPath.row]]
        
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
    
    func addListView() {
        listView = UITableView(frame: CGRect(x: PADDING, y: UIApplication.shared.statusBarFrame.maxY, width: WORKING_SPACE, height: view.frame.height-UIApplication.shared.statusBarFrame.maxY-PADDING))
        listView.register(PokemonRow.self, forCellReuseIdentifier: "pokemonRow")
        listView.delegate = self
        listView.dataSource = self
        listView.rowHeight = 75
        view.addSubview(listView)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        targetPokemon = PokemonGenerator.ALL_POKEMON[favorites_from_storage[indexPath.row]]
        performSegue(withIdentifier: "Fav2Profile", sender: self)
        tableView.deselectRow(at: indexPath, animated: true)

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let profileVC = segue.destination as! ProfileViewController
        profileVC.pokemonProfile = targetPokemon
    }
}
