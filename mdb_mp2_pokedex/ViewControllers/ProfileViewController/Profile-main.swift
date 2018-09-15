//
//  ProfileScreenViewController.swift
//  mdb_mp2_pokedex
//
//  Created by Kayli Jiang on 9/14/18.
//  Copyright © 2018 Ajay Raj Merchia. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
    // UI Spacing
    let PADDING:CGFloat = 0
    var WORKING_SPACE:CGFloat!
    
    // UI Components
    var nameImage: UIImageView!
    var nameOfPoke: UILabel!
    var species_and_type: UILabel!
    
    var addToFav: UIButton!
    var searchWebButton: UIButton!
    
    var statsTable: UITableView!
    
    
    // Data
    var pokemonProfile: Pokemon!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        WORKING_SPACE = view.frame.width - 2 * PADDING

        initImg()
        initText()
        initButton()
        initStats()
        initBackgrounds()
    }
    
    
}
