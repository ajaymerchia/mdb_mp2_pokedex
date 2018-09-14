//
//  PokemonRow.swift
//  mdb_mp2_pokedex
//
//  Created by Ajay Raj Merchia on 9/14/18.
//  Copyright © 2018 Ajay Raj Merchia. All rights reserved.
//

import Foundation
import UIKit

class PokemonRow: UITableViewCell {
    
    var pokemon_image: UIImageView!
    var pokemon_name: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        pokemon_image = UIImageView(frame: CGRect(x: 20, y: 10, width: 30, height: 30))
        
        pokemon_name = UILabel(frame: CGRect(x: 35, y: 0, width: 300, height: 50))
        pokemon_name.textColor = .black

        contentView.addSubview(pokemon_image)
        contentView.addSubview(pokemon_name)
    }
    
}
