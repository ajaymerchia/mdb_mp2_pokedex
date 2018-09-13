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
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        filterImageButton = FilterButton(frame: contentView.frame)
        contentView.addSubview(filterImageButton)
    }
}
