//
//  Favorites-initui.swift
//  mdb_mp2_pokedex
//
//  Created by Ajay Raj Merchia on 9/14/18.
//  Copyright © 2018 Ajay Raj Merchia. All rights reserved.
//

import Foundation
import UIKit

extension FavoritesViewController {
    func init_nav() {
        self.title = "My Favorites"
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.stop, target: self, action: #selector(go_back))
    }
    
    ///Store favorites into an array 
    func buildFavorites() {
        let defaults = UserDefaults.standard
        
        guard let arr = defaults.array(forKey: "favorites") else {
            favorites_from_storage = []
            return
        }
        
        favorites_from_storage = arr as! [Int]
    }
    
    override func viewWillAppear(_ animated: Bool) {
        buildFavorites()
        listView.removeFromSuperview()
        addListView()
    }
    
   
    
    @objc func go_back() {
        self.parent?.dismiss(animated: true, completion: nil)

    }
}
