//
//  WelcomeViewController-filtercell.swift
//  mdb_mp2_pokedex
//
//  Created by Ajay Raj Merchia on 9/12/18.
//  Copyright © 2018 Ajay Raj Merchia. All rights reserved.
//

import Foundation
import UIKit

class FilterButton: UIButton {
    var isValueFilter: Bool = false
}

class FilterCellView: UICollectionViewCell {
    var filterImageButton: FilterButton!
    var points_selected: UILabel!
    var name_of_filter: String!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        let paddingX:CGFloat = 20

        points_selected = UILabel(frame: CGRect(origin: CGPoint(x: contentView.frame.minX+paddingX, y: ( contentView.frame.midY)), size: CGSize(width: contentView.frame.width - 2 * paddingX, height: 20)))
        
        points_selected.textAlignment = .center
        points_selected.textColor = .white
        points_selected.backgroundColor = rgba(0,0,0,0.6)
        points_selected.adjustsFontSizeToFitWidth = true
        points_selected.font = UIFont(name: "Gentona", size: 12)
        
        
            
        points_selected.text = "0-200"
        filterImageButton = FilterButton(frame: contentView.frame)
        contentView.addSubview(filterImageButton)
    }
}
