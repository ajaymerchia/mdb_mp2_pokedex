//
//  SearchViewController-initui.swift
//  mdb_mp2_pokedex
//
//  Created by Ajay Raj Merchia on 9/13/18.
//  Copyright © 2018 Ajay Raj Merchia. All rights reserved.
//

import Foundation
import UIKit

extension SearchViewController {
    func initNav() {
        let access_favorites = UIBarButtonItem(title: "favorites", style: UIBarButtonItemStyle.done, target: self, action: #selector(go_to_fav))
        
        access_favorites.image = favoritesIcon
        self.navigationItem.rightBarButtonItem = access_favorites
    }
    
    @objc func go_to_fav() {
        performSegue(withIdentifier: "Search2Fav", sender: self)
    }
    
    func initLayouts () {
        // Segmented Control Switches
        segmentedControl = UISegmentedControl(items: ["List", "Grid"])
        segmentedControl.selectedSegmentIndex = 0
        segmentedControl.tintColor = .white
        segmentedControl.addTarget(self, action: #selector(switchLayout), for: .valueChanged)
        segmentedControl.setWidth(80, forSegmentAt: 0)
        segmentedControl.setWidth(80, forSegmentAt: 1)
        navigationItem.titleView = segmentedControl
        addListView()
        addGridView()
        switchLayout()
    }
    
    @objc func switchLayout() {
        if segmentedControl.selectedSegmentIndex == 0 {
            gridView?.removeFromSuperview()
            guard let sectionalView = listView else {
                addListView()
                return
            }
            view.addSubview(sectionalView)
        } else {
            listView?.removeFromSuperview()
            guard let sectionalView = gridView else {
                addGridView()
                return
            }
            view.addSubview(sectionalView)
        }
    }
    
    func addListView() {
        listView = UITableView(frame: CGRect(x: PADDING, y: UIApplication.shared.statusBarFrame.maxY, width: WORKING_SPACE, height: view.frame.height-UIApplication.shared.statusBarFrame.maxY-PADDING))
        listView.register(PokemonRow.self, forCellReuseIdentifier: "pokemonRow")
        listView.delegate = self
        listView.dataSource = self
        listView.rowHeight = 75
        view.addSubview(listView)
    }
    
    func addGridView() {
        let results_layout = UICollectionViewFlowLayout()
        results_layout.minimumLineSpacing = 0
        results_layout.minimumInteritemSpacing = 0
        
        gridView = UICollectionView(frame: CGRect(x: PADDING, y: UIApplication.shared.statusBarFrame.maxY, width: WORKING_SPACE, height: view.frame.height-UIApplication.shared.statusBarFrame.maxY-PADDING), collectionViewLayout: results_layout)
        
        gridView.register(PokemonCell.self, forCellWithReuseIdentifier: "pokemonCell")

        gridView.backgroundColor = .white
        gridView.dataSource = self
        gridView.delegate = self
        view.addSubview(gridView)
    }
    
    
    
}
