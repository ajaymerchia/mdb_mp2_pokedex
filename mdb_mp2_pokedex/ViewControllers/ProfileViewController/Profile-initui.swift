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
        let above = addToFav.frame.maxY
        statsTable = UITableView(frame: CGRect(x:PADDING, y:above, width: WORKING_SPACE, height: view.frame.height - above))
        statsTable.register(StatsCells.self, forCellReuseIdentifier: "statsRow")
        statsTable.delegate = self
        statsTable.dataSource = self
        statsTable.rowHeight = 80
        
        view.addSubview(statsTable)
    }
    
    
    func initImg() {
        nameImage = UIImageView(frame: CGRect(x: 0, y: UIApplication.shared.statusBarFrame.maxY+50, width: 200, height: 200))
        nameImage.center = CGPoint(x: view.frame.width/2, y: UIApplication.shared.statusBarFrame.maxY+50 + nameImage.frame.height/2)
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
        nameOfPoke = UILabel(frame: CGRect(x: 0, y:nameImage.frame.maxY, width: view.frame.width, height: 40))
        nameOfPoke.textAlignment = .center
        nameOfPoke.text = "#\(pokemonProfile.number!): " + pokemonProfile.name
        nameOfPoke.font = UIFont(name: "Arial", size: 18)

        view.addSubview(nameOfPoke)
        
        species_and_type = UILabel(frame: CGRect(x: 0, y:nameOfPoke.frame.maxY, width: view.frame.width, height: 20))
        species_and_type.textAlignment = .center
        species_and_type.text = "Species: \(pokemonProfile.species!) || Types: \(pokemonProfile.types.joined(separator: ", "))"
        species_and_type.font = UIFont(name: "Arial", size: 12)
        view.addSubview(species_and_type)
        
    }
    
    func initButton() {
        addToFav = UIButton(frame: CGRect(x: PADDING, y: 350, width: WORKING_SPACE/2, height: 50))
        addToFav.setTitle("Add to Favorites", for: .normal)
        addToFav.addTarget(self, action: #selector(addPokemonToFavorites), for: .touchUpInside)
        addToFav.backgroundColor = UIColor.flatBlueDark
        view.addSubview(addToFav)
        
        addToFav = UIButton(frame: CGRect(x: addToFav.frame.maxX, y: addToFav.frame.minY, width: (view.frame.width - 40)/2, height: 50))
        addToFav.setTitle("Search the Web", for: .normal)
        addToFav.addTarget(self, action: #selector(searchWeb), for: .touchUpInside)
        addToFav.backgroundColor = UIColor.flatBlue
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
    
    @objc func searchWeb() {
        let target_url = "https://google.com/search?q=" + makeURLSafe(url: pokemonProfile.name)
        guard let url = URL(string: target_url) else { return }
        UIApplication.shared.open(url)
    }
    
    func makeURLSafe(url: String) -> String{
        var ret_url = url.lowercased()
        ret_url = ret_url.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!
        return ret_url
    }
}


