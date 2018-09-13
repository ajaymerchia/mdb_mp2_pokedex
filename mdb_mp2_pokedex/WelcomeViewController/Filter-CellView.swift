//
//  WelcomeViewController-filtercell.swift
//  mdb_mp2_pokedex
//
//  Created by Ajay Raj Merchia on 9/12/18.
//  Copyright © 2018 Ajay Raj Merchia. All rights reserved.
//

import Foundation
import UIKit

class FilterCellView: UICollectionViewCell {
    var filterImageButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        filterImageButton = UIButton(frame: contentView.frame)
        contentView.addSubview(filterImageButton)

        
        
    }
}
