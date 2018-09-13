//
//  WelcomeViewController-collectionviewsrc.swift
//  mdb_mp2_pokedex
//
//  Created by Ajay Raj Merchia on 9/12/18.
//  Copyright © 2018 Ajay Raj Merchia. All rights reserved.
//

import Foundation
import UIKit

extension WelcomeViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Pokemon.ALL_POKE_FILTERS.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let IMG_WIDTH:Double = 266
        let IMG_HEIGHT:Double = 339
        let FINAL_WIDTH:Double = 100
        
        return CGSize(width: FINAL_WIDTH, height: IMG_HEIGHT/IMG_WIDTH * FINAL_WIDTH)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
       
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "filterCell", for: indexPath) as! FilterCellView
        
        for subview in cell.contentView.subviews {
            subview.removeFromSuperview()
        }
        
        cell.awakeFromNib()
        let current_filter = Pokemon.ALL_POKE_FILTERS[indexPath.row]
        
        cell.filterImageButton.setImage(UIImage(named: "lite_pokefilter_"+current_filter.lowercased()), for: UIControlState.normal)
        cell.filterImageButton.setImage(UIImage(named: "pokefilter_"+current_filter.lowercased()), for: UIControlState.selected)
        cell.filterImageButton.tag = indexPath.row
        cell.filterImageButton.addTarget(self, action: #selector(set_filter_state), for: .touchUpInside)

        
        return cell
    }
    
    @objc func set_filter_state(sender: UIButton) {
        sender.isSelected = !sender.isSelected
        debugPrint(sender.tag, Pokemon.ALL_POKE_FILTERS[sender.tag])
    }
    
    
}
