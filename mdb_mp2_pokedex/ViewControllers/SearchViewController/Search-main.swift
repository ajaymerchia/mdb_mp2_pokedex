//
//  SearchViewController.swift
//  mdb_mp2_pokedex
//
//  Created by Ajay Raj Merchia on 9/13/18.
//  Copyright © 2018 Ajay Raj Merchia. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {
    // DATA
    var pokemonResults:[Pokemon]!
    var gridView: UICollectionView!
    var listView: UITableView!
    let favoritesIcon = UIImage(named: "favorites")
    var targetPokemon: Pokemon!

    // UISpacing Components
    let PADDING:CGFloat = 20
    var WORKING_SPACE:CGFloat!
    
    // Layout Structures
    var segmentedControl:UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        WORKING_SPACE = view.frame.width - 2 * PADDING
        initNav()
        initLayouts()
    }

}
