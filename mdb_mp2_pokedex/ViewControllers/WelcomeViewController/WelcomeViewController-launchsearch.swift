//
//  WelcomeViewController-launchsearch.swift
//  mdb_mp2_pokedex
//
//  Created by Ajay Raj Merchia on 9/13/18.
//  Copyright © 2018 Ajay Raj Merchia. All rights reserved.
//

import Foundation
import UIKit
extension WelcomeViewController {
    @objc func filterSearch(){
        qualifiedPokemon = searchByActiveFilters()
        performSegue(withIdentifier: "toSearchResults", sender: self)
    }
    
    @objc func randomSearch() {
        var random_options_selected = Set<Int>()
        
        let totalPokemon = UInt32(PokemonGenerator.ALL_POKEMON.count)

        while random_options_selected.count < 20 {
            let random_index = Int(arc4random_uniform(totalPokemon))
            random_options_selected.insert(random_index)
        }
        
        qualifiedPokemon = []
        
        for option in random_options_selected {
            qualifiedPokemon.append(PokemonGenerator.ALL_POKEMON[option])
        }
        performSegue(withIdentifier: "toSearchResults", sender: self)
    }
    
    
    // Informs the new GameScreenController of a stats score to preload.
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let searchVC = segue.destination as! SearchViewController
        searchVC.pokemonResults = qualifiedPokemon
    }
    
    func searchByActiveFilters() -> [Pokemon] {
        var qualifiedPokemon:[Pokemon] = []
        for poke in PokemonGenerator.ALL_POKEMON {
            var satisfies = true
            for filter in selected_filters {
                if !filter.pred(x: poke) {
                    satisfies = false
                    break
                }
            }
            if satisfies {
                qualifiedPokemon.append(poke)
            }
        }
        
        return qualifiedPokemon
    }
}
