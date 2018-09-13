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
    var filterImage: UIImageView!
    var filterImageButton: UIButton!
    
    var filterName: UILabel!
    var filterInputBounds: UILabel?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
//        filterName = UILabel(frame: CGRect(x: 0, y: contentView.frame.height/2, width: contentView.frame.width, height: contentView.frame.height))
//        filterName.clipsToBounds = true
//        filterName.textColor = .black
//        filterName.textAlignment = .center
//        contentView.addSubview(filterName)

        
        filterImage = UIImageView(frame: contentView.frame)
//        filterImage = UIImageView(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
//        filterImage.center = CGPoint(x: contentView.frame.width/2, y: 25)
        filterImage.contentMode = .scaleAspectFit
//        contentView.addSubview(filterImage)
        
        filterImageButton = UIButton(frame: contentView.frame)
        contentView.addSubview(filterImageButton)

        
        
    }
}
