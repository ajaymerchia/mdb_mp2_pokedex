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
        stat_logo = UIImageView(frame: CGRect(x: 10, y: 10, width: 60, height: 60))
        stat_logo.image = #imageLiteral(resourceName: "pokeball")
        
        stat_label = UILabel(frame: CGRect(x: 90, y: contentView.frame.midY-20, width: 300, height: 40))
        
        stat_label.font = UIFont(name: "Gentona-Bold", size: 30)
        stat_label.textColor = .black
        
        contentView.addSubview(stat_logo)
        contentView.addSubview(stat_label)
    }

 }
