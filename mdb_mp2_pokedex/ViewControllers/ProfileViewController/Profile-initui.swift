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
    
    
    /// Adds the main pokemon image from async web pull
    func initImg() {
        nameImage = UIImageView(frame: CGRect(x: 0, y: UIApplication.shared.statusBarFrame.maxY+50, width: 200, height: 200))
        nameImage.center = CGPoint(x: view.frame.width/2, y: UIApplication.shared.statusBarFrame.maxY+50 + nameImage.frame.height/2)
        nameImage.contentMode = .scaleAspectFit
        
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
    
    // Adds the name and overview details of the Pokemon
    func initText() {
        nameOfPoke = UILabel(frame: CGRect(x: 0, y:nameImage.frame.maxY, width: view.frame.width, height: 40))
        nameOfPoke.textAlignment = .center
        nameOfPoke.text = "#\(pokemonProfile.number!): " + pokemonProfile.name
        nameOfPoke.font = UIFont(name: "Gentona-Bold", size: 24)
        view.addSubview(nameOfPoke)
        
        
        species_and_type = UILabel(frame: CGRect(x: 0, y:nameOfPoke.frame.maxY, width: view.frame.width, height: 20))
        species_and_type.textAlignment = .center
        
        var strbuilder = ""
        if pokemonProfile.species != "" {
            strbuilder += "Species: \(pokemonProfile.species!) || "
        }
        if pokemonProfile.types.count != 0 {
            strbuilder += "Types: \(pokemonProfile.types.joined(separator: ", "))"
        }
        
        species_and_type.text = strbuilder
        species_and_type.font = UIFont(name: "Gentona-BookItalic", size: 15)
        view.addSubview(species_and_type)
        
    }
    
    ///Initializing buttons for favorites and search the web
    func initButton() {
        addToFav = UIButton(frame: CGRect(x: PADDING, y: 350, width: WORKING_SPACE/2, height: 50))
        addToFav.setTitle("♡ Favorite", for: .normal)
        addToFav.setTitle("❤️ Unfavorite", for: .selected)
        setFavoriteState()
        addToFav.addTarget(self, action: #selector(favorite_handler), for: .touchUpInside)
        addToFav.backgroundColor = UIColor.flatSkyBlue
        view.addSubview(addToFav)
        
        searchWebButton = UIButton(frame: CGRect(x: addToFav.frame.maxX, y: addToFav.frame.minY, width: (view.frame.width - 2*PADDING)/2, height: 50))
        searchWebButton.setTitle("Search the Web ", for: .normal)
        searchWebButton.addTarget(self, action: #selector(searchWeb), for: .touchUpInside)
        searchWebButton.backgroundColor = UIColor.flatSkyBlueDark
        view.addSubview(searchWebButton)
    }
    
    
    /// Adds the stats table UI component to the view
    func initStats(){
        let above = addToFav.frame.maxY
        statsTable = UITableView(frame: CGRect(x:PADDING, y:above, width: WORKING_SPACE, height: view.frame.height - above))
        statsTable.register(StatsCells.self, forCellReuseIdentifier: "statsRow")
        statsTable.delegate = self
        statsTable.dataSource = self
        statsTable.rowHeight = 80
        statsTable.backgroundColor = rgba(255,255,255,0)

        
        view.addSubview(statsTable)
    }
    
    /// Sets background colors in this view
    func initBackgrounds() {
        let bottomColor = UIView(frame: CGRect(x: 0, y: addToFav.frame.maxY, width: view.frame.width, height: view.frame.height - addToFav.frame.maxX))
        
        let gray:CGFloat = 240
        bottomColor.backgroundColor = rgba(gray,gray,gray,1)
        view.insertSubview(bottomColor, at: 0)
    }
    
    
    
    
    
}


