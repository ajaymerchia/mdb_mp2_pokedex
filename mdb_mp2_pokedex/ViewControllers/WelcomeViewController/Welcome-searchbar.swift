//
//  Welcome-searchbar.swift
//  mdb_mp2_pokedex
//
//  Created by Ajay Raj Merchia on 9/14/18.
//  Copyright © 2018 Ajay Raj Merchia. All rights reserved.
//

import Foundation
import UIKit

extension WelcomeViewController {
    
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        // nuke existing filters
        selected_filters = []
        
        searchBar.resignFirstResponder()
        
        if searchBar.text == "" {
            dismissKeyboard()
            return
        }
        
        // based on content, add a new filter
        let currSearch = searchBar.text!.split(separator: " ")
        
        
        for raw_query in currSearch {
            var query_term:String = String(raw_query)
            if let removable_index = query_term.index(of: "#") {
                query_term.remove(at: removable_index)
            }
            
            if let poke_number = Int(query_term){
                selected_filters.append(SearchFilter.create_numb_filter(number: poke_number))

            } else {
                selected_filters.append(SearchFilter.create_name_filter(name: query_term))
            }
        }
        
        searchBarSearch()
        searchBar.text = ""
    }
    
    
    
    @objc func dismissKeyboard(){
        navigationItem.titleView?.endEditing(true)
    }
}
