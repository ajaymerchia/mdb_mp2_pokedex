//
//  WelcomeViewController-initui.swift
//  mdb_mp2_pokedex
//
//  Created by Ajay Raj Merchia on 9/11/18.
//  Copyright © 2018 Ajay Raj Merchia. All rights reserved.
//

import Foundation
import UIKit

extension WelcomeViewController {
    func init_img() {
        header_img = UIImageView(frame: CGRect(x: 0, y: 0, width: view.frame.width - 2*PADDING, height: 100))
        header_img.center = CGPoint(x: view.frame.width/2, y: view.frame.height/6)
        header_img.image = UIImage(named: "pokedex_logo")
        header_img.contentMode = .scaleAspectFit
        view.addSubview(header_img)
        
    }
    
    func init_buttons() {
        filteredSearch = UIButton(frame: CGRect(x: PADDING, y: filterCollectionView.frame.maxY + 30, width: (view.frame.width-2*PADDING)/2, height: 40))
        filteredSearch.setTitle("Search", for: .normal)
        filteredSearch.titleLabel?.font = UIFont(name: "Gentona-Book-Bold", size: 24)
        filteredSearch.backgroundColor = .blue
        filteredSearch.addTarget(self, action: #selector(filterSearch), for: .touchUpInside)
        view.addSubview(filteredSearch)
        
        
        randomizedSearch = UIButton(frame: CGRect(x: filteredSearch.frame.maxX, y: filterCollectionView.frame.maxY + 30, width: (view.frame.width-2*PADDING)/2, height: 40))
        randomizedSearch.setTitle("Randomize", for: .normal)
        filteredSearch.titleLabel?.font = UIFont(name: "Gentona-Book-Bold", size: 24)
        randomizedSearch.addTarget(self, action: #selector(randomSearch), for: .touchUpInside)
        randomizedSearch.backgroundColor = .green
        
        view.addSubview(randomizedSearch)
    }
    
    func init_text() {
        
        
    }
    
    func init_grid() {
        let filter_grid_layout = UICollectionViewFlowLayout()
        filter_grid_layout.minimumLineSpacing = 10
        filter_grid_layout.minimumInteritemSpacing = 10
        
        filterCollectionView = UICollectionView(frame: CGRect(x: PADDING, y: header_img.frame.maxY + PADDING, width: WORKING_SPACE, height: view.frame.height/1.75), collectionViewLayout: filter_grid_layout)
        filterCollectionView.register(FilterCellView.self, forCellWithReuseIdentifier: "filterCell")
        filterCollectionView.contentInset = UIEdgeInsetsMake(0, 10, 0, 10)
        filterCollectionView.backgroundColor = .white
        filterCollectionView.dataSource = self
        filterCollectionView.delegate = self
        view.addSubview(filterCollectionView)
    }
    
    
}
