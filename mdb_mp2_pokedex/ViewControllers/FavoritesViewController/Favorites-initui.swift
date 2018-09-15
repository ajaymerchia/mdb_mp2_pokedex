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
    
    /// Create the nav button for removing this VC and put in top left
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
    
    
    /// Initialize the list view for favorited pokemon
    func addListView() {
        listView = UITableView(frame: CGRect(x: PADDING, y: UIApplication.shared.statusBarFrame.maxY, width: WORKING_SPACE, height: view.frame.height-UIApplication.shared.statusBarFrame.maxY-PADDING))
        listView.register(PokemonRow.self, forCellReuseIdentifier: "pokemonRow")
        listView.delegate = self
        listView.dataSource = self
        listView.rowHeight = 75
        view.addSubview(listView)
    }
    
    
    /// Any time the view appears, make sure it has the most updated list of pokemon
    ///
    /// - Parameter animated: animation with appearance (pass through)
    override func viewWillAppear(_ animated: Bool) {
        buildFavorites()
        listView.removeFromSuperview()
        addListView()
    }
    
    /// Dismisses current VC and returns to parent
    @objc func go_back() {
        self.parent?.dismiss(animated: true, completion: nil)

    }
}
