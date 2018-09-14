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
    var attackLabel: UILabel!
    var attackImage: UIImageView!
    var defenseLabel: UILabel!
    var defenseImage: UIImageView!
    var healthLabel: UILabel!
    var healthImage: UIImageView!
    var spALabel: UILabel!
    var spAImage: UIImageView!
    var spDLabel: UILabel!
    var spDImage: UIImageView!
    var speciesLabel: UILabel!
    var speciesImage: UIImageView!
    var speedLabel: UILabel!
    var speedImage: UIImageView!
    var totalLabel: UILabel!
    var totalImage: UIImageView!
    var typesLabel: UILabel!
    var typesImage: UIImageView!
    var addToFav: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        initNav()
        initStats()
        initText()
        initImg()
        initButton()
    }
    
    
}
