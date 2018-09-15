//
//  WelcomeViewController-initui.swift
//  mdb_mp2_pokedex
//
//  Created by Ajay Raj Merchia on 9/11/18.
//  Copyright © 2018 Ajay Raj Merchia. All rights reserved.
//

import Foundation
import UIKit
import ChameleonFramework

extension WelcomeViewController {
    
    func init_search(){
        searchBar = UISearchBar()
        searchBar.delegate = self
        searchBar.sizeToFit()
        searchBar.placeholder = "Search by name or number!"
        
        let searchBarTextField = searchBar.value(forKey: "searchField") as! UITextField
        searchBarTextField.tintColor = UIColor.flatBlueDark
        
        self.extendedLayoutIncludesOpaqueBars = true
        
        
        navigationItem.titleView = searchBar
        navigationController?.navigationBar.backgroundColor = UIColor(red:0.93, green:0.08, blue:0.08, alpha:1.0)
        
        
        let tapOutside: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tapOutside)
        
    }
    
    func init_nav() {
        navigationController?.navigationBar.barTintColor = UIColor.flatSkyBlue
        navigationController?.navigationBar.tintColor = .white
        
        let access_favorites = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.organize, target: self, action: #selector(go_to_fav))
        navigationItem.rightBarButtonItem = access_favorites
        
    }
    
    @objc func go_to_fav() {
        performSegue(withIdentifier: "Welcome2Fav", sender: self)
    }
    
    func init_img() {
        header_img = UIImageView(frame: CGRect(x: 0, y: 0, width: view.frame.width - 2*PADDING, height: 100))
        header_img.center = CGPoint(x: view.frame.width/2, y: view.frame.height/6)
        header_img.image = UIImage(named: "pokedex_logo")
        header_img.contentMode = .scaleAspectFit
        view.addSubview(header_img)
        
    }
    
    func init_buttons() {
        filteredSearch = UIButton(frame: CGRect(x: 0, y: view.frame.height-40, width: view.frame.width/2, height: 40))
        filteredSearch.setTitle("Search", for: .normal)
//        filteredSearch.titleLabel!.font = UIFont(name: "Courier-BoldOblique", size: 24)
//        
//        for family in UIFont.familyNames.sorted() {
//            let names = UIFont.fontNames(forFamilyName: family)
//            print("Family: \(family) Font names: \(names)")
//        }
        filteredSearch.backgroundColor = UIColor.flatSkyBlue
        filteredSearch.addTarget(self, action: #selector(filterSearch), for: .touchUpInside)
        view.addSubview(filteredSearch)
        
        
        randomizedSearch = UIButton(frame: CGRect(x: filteredSearch.frame.maxX, y: view.frame.height-40, width: view.frame.width/2, height: 40))
        randomizedSearch.setTitle("Randomize", for: .normal)
        randomizedSearch.titleLabel!.font = UIFont(name: "Gentona-Bold", size: 24)
        randomizedSearch.addTarget(self, action: #selector(randomSearch), for: .touchUpInside)
        randomizedSearch.backgroundColor = UIColor.flatSkyBlueDark
        
        view.addSubview(randomizedSearch)
    }
    
    func init_text() {
        header_txt = UILabel(frame: CGRect(x: 0, y: header_img.frame.maxY, width: view.frame.width, height: 40))
        header_txt.text = "Find your Pokèmon!"
        header_txt.textAlignment = .center
        view.addSubview(header_txt)
    }
 
    func init_grid() {
        let filter_grid_layout = UICollectionViewFlowLayout()
        filter_grid_layout.minimumLineSpacing = 10
        filter_grid_layout.minimumInteritemSpacing = 10
        filter_grid_layout.sectionInset = UIEdgeInsets(top: 10, left: 0, bottom: 20, right: 0)
        
        filterCollectionView = UICollectionView(frame: CGRect(x: PADDING, y: header_txt.frame.maxY + PADDING, width: WORKING_SPACE, height: view.frame.height-(header_txt.frame.maxY + PADDING + randomizedSearch.frame.height)), collectionViewLayout: filter_grid_layout)
        filterCollectionView.register(FilterCellView.self, forCellWithReuseIdentifier: "filterCell")
        filterCollectionView.contentInset = UIEdgeInsetsMake(0, 10, 0, 10)
        filterCollectionView.backgroundColor = .white
        filterCollectionView.dataSource = self
        filterCollectionView.delegate = self
        view.addSubview(filterCollectionView)
    }
    
    
}
