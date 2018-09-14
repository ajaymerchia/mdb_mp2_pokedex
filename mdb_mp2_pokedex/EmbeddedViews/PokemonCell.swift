//
//  Search-gridcell.swift
//  mdb_mp2_pokedex
//
//  Created by Ajay Raj Merchia on 9/12/18.
//  Copyright © 2018 Ajay Raj Merchia. All rights reserved.
//

import Foundation
import UIKit

class PokemonCell: UICollectionViewCell {
    var pokemon_name: UILabel!
    var pokemon_image: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
        pokemon_image = UIImageView(frame: contentView.frame)
        pokemon_image.image = UIImage(named: "pokeball")
        pokemon_image.contentMode = .scaleAspectFit
        
        contentView.addSubview(pokemon_image)
        
        let paddingX:CGFloat = 20
        
        pokemon_name = UILabel(frame: CGRect(origin: CGPoint(x: contentView.frame.minX+paddingX, y: ( contentView.frame.midY)), size: CGSize(width: contentView.frame.width - 2 * paddingX, height: 20)))
        
        pokemon_name.textAlignment = .center
        pokemon_name.textColor = .white
        pokemon_name.backgroundColor = rgba(0,0,0,0.6)
        pokemon_name.adjustsFontSizeToFitWidth = true
        pokemon_name.font = UIFont(name: "Gentona", size: 12)
        
        pokemon_name.text = "hello mate"
        contentView.addSubview(pokemon_name)
        
        
    }
}
