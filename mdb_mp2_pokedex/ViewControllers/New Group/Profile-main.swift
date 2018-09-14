//
//  ProfileScreenViewController.swift
//  mdb_mp2_pokedex
//
//  Created by Kayli  Jiang on 9/14/18.
//  Copyright © 2018 Ajay Raj Merchia. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
    
    //(name: key, number: number, attack: attack, defense: defense, health: hp, spAttack: spatk, spDef: spdef, species: species, speed: speed, total: total, types: type)
    var statsTable: UITableView!
    var pokemon: [Pokemon] = PokemonGenerator.ALL_POKEMON
    
    var nameImage: UIImageView!
    //var nameLabel: UILabel!
    //var attackLabel: UILabel! = pokemon[2]
    var attackImage: UIImageView!
    //var defenseLabel: UILabel! = pokemon[3]
    var defenseImage: UIImageView!
    //var healthLabel: UILabel! = pokemon[4]
    var healthImage: UIImageView!
    //var spAttackLabel: UILabel! = pokemon[5]
    var spAttackImage: UIImageView!
    //var spDefLabel: UILabel! = pokemon[6]
    var spDefImage: UIImageView!
    //var speciesLabel: UILabel! = pokemon[7]
    //var speedLabel: UILabel! = pokemon[8]
    //var totalLabel: UILabel! = pokemon[9]
    //var typesLabel: UILabel! = pokemon[10]

    override func viewDidLoad() {
        super.viewDidLoad()
        loadStatsTable()
        // Do any additional setup after loading the view.
    }
    
    func loadStatsTable(){
        let PADDING: CGFloat = 20
        let WORKING_SPACE = view.frame.width - 2 * PADDING
        let UIComponentAbove = view.frame.height/2 //webSearchButton.frame.max.Y
        statsTable = UITableView(frame: CGRect(x:PADDING, y:UIComponentAbove, width: WORKING_SPACE, height: view.frame.height - UIComponentAbove - PADDING))
        statsTable.register(StatsCells.self, forCellReuseIdentifier: "statsRow")
        statsTable.delegate = self
        statsTable.rowHeight = 10
        
        view.addSubview(statsTable)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
