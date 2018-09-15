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
        pokemon_image = UIImageView(frame: CGRect(x: 15, y: 10, width: 40, height: 40))
        
        pokemon_name = UILabel(frame: CGRect(x: 75, y: 13, width: 300, height: 50))
        pokemon_name.textColor = .black
        pokemon_name.font = UIFont(name: "Gentona-Book", size: 18)

        contentView.addSubview(pokemon_image)
        contentView.addSubview(pokemon_name)
    }
    
}
