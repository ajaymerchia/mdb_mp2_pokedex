 //
//  StatsCells.swift
//  mdb_mp2_pokedex
//
//  Created by Kayli  Jiang on 9/14/18.
//  Copyright © 2018 Ajay Raj Merchia. All rights reserved.
//

import Foundation
import UIKit
 
 /// Cells that hold statistics
 class StatsCells: UITableViewCell {
    var stat_label: UILabel!
    var stat_logo: UIImageView!
    let offSet: CGFloat! = 25
    
    override func awakeFromNib() {
        super.awakeFromNib()
        stat_logo = UIImageView(frame: CGRect(x: 10 + offSet, y: 10, width: 60, height: 60))
        stat_logo.image = #imageLiteral(resourceName: "pokeball")
        
        stat_label = UILabel(frame: CGRect(x: stat_logo.frame.maxX + offSet, y: 20, width: 300, height: 40))
        
        stat_label.font = UIFont(name: "Gentona-Book", size: 22)
        stat_label.textColor = .black
        
        self.backgroundColor = rgba(255,255,255,0)
        
        selectionStyle = UITableViewCellSelectionStyle.none
        
        contentView.addSubview(stat_logo)
        contentView.addSubview(stat_label)
    }

 }
