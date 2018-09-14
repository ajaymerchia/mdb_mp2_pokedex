//
//  FavoritesViewController.swift
//  mdb_mp2_pokedex
//
//  Created by Ajay Raj Merchia on 9/14/18.
//  Copyright © 2018 Ajay Raj Merchia. All rights reserved.
//

import UIKit

class FavoritesViewController: UIViewController {

    let PADDING:CGFloat = 20
    var WORKING_SPACE:CGFloat!
    var listView: UITableView!
    
    var favorites_from_storage:[Int] = []

    
    override func viewDidLoad() {
        super.viewDidLoad()

        WORKING_SPACE = view.frame.width - 2 * PADDING
        // Do any additional setup after loading the view.
        init_nav()
        buildFavorites()
        addListView()
    }

   
}
