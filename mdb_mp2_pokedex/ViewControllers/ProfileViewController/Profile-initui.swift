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
        statsTable.rowHeight = 80
        
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
        
    }
    
    func initButton() {
        addToFav = UIButton(frame: CGRect(x: 20, y: 250, width: (view.frame.width - 40)/2, height: 50))
        addToFav.setTitle("Add to Favorites", for: .normal)
        addToFav.addTarget(self, action: #selector(addPokemonToFavorites), for: .touchUpInside)
        addToFav.backgroundColor = UIColor.flatBlueDark
        view.addSubview(addToFav)
    }
    
    @objc func addPokemonToFavorites() {
        let defaults = UserDefaults.standard
        
        var _target:[Int] = [pokemonProfile.uid]
        guard let arr = defaults.array(forKey: "favorites") else {
            defaults.set(_target, forKey: "favorites")
            return
        }
        
        
        let arr_casted = arr as! [Int]
        
        if !arr_casted.contains(pokemonProfile.uid) {
            _target = _target + arr_casted
            defaults.set(_target, forKey: "favorites")
        }
        
        debugPrint(defaults)
        
    }
}


