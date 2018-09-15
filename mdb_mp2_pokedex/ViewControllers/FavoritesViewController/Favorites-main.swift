//
//  FavoritesViewController.swift
//  mdb_mp2_pokedex
//
//  Created by Ajay Raj Merchia on 9/14/18.
//  Copyright © 2018 Ajay Raj Merchia. All rights reserved.
//

import UIKit

class FavoritesViewController: UIViewController {
    
    // UI Layout Variables
    let PADDING:CGFloat = 20
    var WORKING_SPACE:CGFloat!
    
    // Components
    var listView: UITableView!
    
    // Data
    var targetPokemon:Pokemon!
    var favorites_from_storage:[Int] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        WORKING_SPACE = view.frame.width - 2 * PADDING
        init_nav()
        buildFavorites()
        addListView()
    }
    
    
}
