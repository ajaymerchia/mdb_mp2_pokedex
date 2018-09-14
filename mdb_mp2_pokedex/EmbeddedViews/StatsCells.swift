 //
//  StatsCells.swift
//  mdb_mp2_pokedex
//
//  Created by Kayli  Jiang on 9/14/18.
//  Copyright © 2018 Ajay Raj Merchia. All rights reserved.
//

import Foundation
import UIKit
 
 class StatsCells: UITableViewCell {
    var stat_label: UILabel!
    var stat_logo: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        stat_logo = UIImageView(frame: CGRect(x: 20, y: 10, width: 30, height: 30))
        stat_logo.image = #imageLiteral(resourceName: "pokeball")
        
        stat_label = UILabel(frame: CGRect(x: 35, y: 0, width: 300, height: 50))
        stat_label.textColor = .black
        stat_label.text = "some label my dudes"
        
        contentView.addSubview(stat_logo)
        contentView.addSubview(stat_label)
    }

 }
