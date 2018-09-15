//
//  Profile-logic.swift
//  mdb_mp2_pokedex
//
//  Created by Ajay Raj Merchia on 9/14/18.
//  Copyright © 2018 Ajay Raj Merchia. All rights reserved.
//

import Foundation
import UIKit

extension ProfileViewController {
    ///Accounts for removing or adding a pokemon to favorites upon hitting the favorites button
    @objc func favorite_handler(sender: UIButton) {
        if sender.isSelected {
            removePokemonFromFavorites()
        } else {
            addPokemonToFavorites()
        }
    }
    
    
    /// Adds the current pokemon to locally stored favorites
    @objc func addPokemonToFavorites() {
        let defaults = UserDefaults.standard
        
        var _target:[Int] = [pokemonProfile.uid]
        guard let arr = defaults.array(forKey: "favorites") else {
            defaults.set(_target, forKey: "favorites")
            return
        }
        
        
        let arr_casted = arr as! [Int]
        if !arr_casted.contains(pokemonProfile.uid) {
            _target = _target + arr_casted
            defaults.set(_target, forKey: "favorites")
        }
        
        addToFav.isSelected = true
        
    }
    
    
    /// Removes the current pokemon from locally stored favorites
    @objc func removePokemonFromFavorites() {
        let defaults = UserDefaults.standard
        
        if let arr = defaults.array(forKey: "favorites") {
            if let arr_casted:[Int] = arr as? [Int] {
                var arr_casted2 = arr_casted
                let ind = arr_casted2.index(of: pokemonProfile.uid)!
                arr_casted2.remove(at: ind)
                defaults.set(arr_casted2, forKey: "favorites")
            }
        }
        
        addToFav.isSelected = false
        
    }
    
    
    /// Launches the webpage searching for this pokemon
    @objc func searchWeb() {
        let target_url = "https://google.com/search?q=" + makeURLSafe(url: pokemonProfile.name)
        guard let url = URL(string: target_url) else { return }
        UIApplication.shared.open(url)
    }
    
    ///Changes the encoding of special characters to make it safe
    func makeURLSafe(url: String) -> String{
        var ret_url = url.lowercased()
        ret_url = ret_url.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!
        return ret_url
    }
    
    ///Previously favorited pokemon are set to favorited state
    func setFavoriteState() {
        let defaults = UserDefaults.standard
        guard let arr = defaults.array(forKey: "favorites") else {
            return
        }
        
        if let arr_casted:[Int] = arr as? [Int] {
            if arr_casted.contains(pokemonProfile.uid) {
                addToFav.isSelected = true
            } else {
                addToFav.isSelected = false
            }
            
        }
    }
}
