//
//  Profile-initui.swift
//  mdb_mp2_pokedex
//
//  Created by Ajay Raj Merchia on 9/14/18.
//  Copyright © 2018 Ajay Raj Merchia. All rights reserved.
//

import Foundation
import UIKit
extension ProfileViewController {
    func initStats(){
        let PADDING: CGFloat = 20
        let WORKING_SPACE = view.frame.width - 2 * PADDING
        let UIComponentAbove = view.frame.height/2 
        statsTable = UITableView(frame: CGRect(x:PADDING, y:UIComponentAbove, width: WORKING_SPACE, height: view.frame.height - UIComponentAbove - PADDING))
        statsTable.register(StatsCells.self, forCellReuseIdentifier: "statsRow")
        statsTable.delegate = self
        statsTable.dataSource = self
        statsTable.rowHeight = 40
        
        view.addSubview(statsTable)
    }
    
    
    func initImg() {
        nameImage = UIImageView(frame: CGRect(x: 20, y: UIApplication.shared.statusBarFrame.maxY+50, width: 100, height: 100))
        if let imageUrl:URL = URL(string: pokemonProfile.imageUrl) {
            DispatchQueue.global().async {
                
                let data = try? Data(contentsOf: imageUrl)
                DispatchQueue.main.async {
                    if let retrievedImage = data {
                        self.nameImage.image = UIImage(data: retrievedImage)
                    }
                    else {
                        self.nameImage.image = #imageLiteral(resourceName: "pokeball")
                    }
                }
                
            }
        } else {
            nameImage.image = #imageLiteral(resourceName: "pokeball")
        }
        view.addSubview(nameImage)
        
            
    }
    
    func initText() {
        nameOfPoke = UILabel(frame: CGRect(x: 120, y: UIApplication.shared.statusBarFrame.maxY+50, width: view.frame.width-120, height: 40))
        nameOfPoke.text = pokemonProfile.name
        view.addSubview(nameOfPoke)
        
        attackLabel = UILabel(frame: CGRect(x: 120, y: UIApplication.shared.statusBarFrame.maY + 50, width: view.frame.width - 120, height: 40))
        attackLabel.text = pokemonProfile.attack
        view.addSubview(attackLabel)
        
        defenseLabel = UILabel(frame: CGRect(x: 120, y: UIApplication.shared.statusBarFrame.maY + 50, width: view.frame.width - 120, height: 40))
        defenseLabel.text = pokemonProfile.defense
        view.addSubview(defenseLabel)
        
        healthLabel = UILabel(frame: CGRect(x: 120, y: UIApplication.shared.statusBarFrame.maY + 50, width: view.frame.width - 120, height: 40))
        healthLabel.text = pokemonProfile.health
        view.addSubview(healthLabel)
        
        spALabel = UILabel(frame: CGRect(x: 120, y: UIApplication.shared.statusBarFrame.maY + 50, width: view.frame.width - 120, height: 40))
        spALabel.text = pokemonProfile.specialAttack
        view.addSubview(spALabel)
        
        spDLabel = UILabel(frame: CGRect(x: 120, y: UIApplication.shared.statusBarFrame.maY + 50, width: view.frame.width - 120, height: 40))
        spDLabel.text = pokemonProfile.specialDefense
        view.addSubview(spDLabel)
        
        speciesLabel = UILabel(frame: CGRect(x: 120, y: UIApplication.shared.statusBarFrame.maY + 50, width: view.frame.width - 120, height: 40))
        speciesLabel.text = pokemonProfile.species
        view.addSubview(speciesLabel)
        
        speedLabel = UILabel(frame: CGRect(x: 120, y: UIApplication.shared.statusBarFrame.maY + 50, width: view.frame.width - 120, height: 40))
        speedLabel.text = pokemonProfile.speed
        view.addSubview(speedLabel)
        
        totalLabel = UILabel(frame: CGRect(x: 120, y: UIApplication.shared.statusBarFrame.maY + 50, width: view.frame.width - 120, height: 40))
        totalLabel.text = pokemonProfile.total
        view.addSubview(totalLabel)
        
        typesLabel = UILabel(frame: CGRect(x: 120, y: UIApplication.shared.statusBarFrame.maY + 50, width: view.frame.width - 120, height: 40))
        typesLabel.text = pokemonProfile.types
        view.addSubview(typesLabel)
    }
    
    func initButton() {
        addToFav = UIButton(frame: CGRect(x: 20, y: 250, width: (view.frame.width - 40)/2, height: 50))
        addToFav.setTitle("Add to Favorites", for: .normal)
        addToFav.backgroundColor = UIColor.flatBlueDark
        view.addSubview(addToFav)
    }
    
    //(name: key, number: number, attack: attack, defense: defense, health: hp, spAttack: spatk, spDef: spdef, species: species, speed: speed, total: total, types: type)
}



