//
//  ProfileScreenViewController.swift
//  mdb_mp2_pokedex
//
//  Created by Kayli Jiang on 9/14/18.
//  Copyright © 2018 Ajay Raj Merchia. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
    
    //(name: key, number: number, attack: attack, defense: defense, health: hp, spAttack: spatk, spDef: spdef, species: species, speed: speed, total: total, types: type)
    var statsTable: UITableView!
    var pokemonProfile: Pokemon!
    
    var nameImage: UIImageView!
    var nameOfPoke: UILabel!
    var species_and_type: UILabel!
    var addToFav: UIButton!
    var searchWebButton: UIButton!
    
    let PADDING:CGFloat = 0
    var WORKING_SPACE:CGFloat!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        WORKING_SPACE = view.frame.width - 2 * PADDING

        // Do any additional setup after loading the view.
        initImg()
        initText()
        initButton()
        initStats()
        initBackgrounds()
    }
    
    
}
