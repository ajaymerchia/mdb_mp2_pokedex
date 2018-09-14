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
    func initLayouts () {
        // Segmented Control Switches
        segmentedControl = UISegmentedControl(items: ["List", "Grid"])
        segmentedControl.selectedSegmentIndex = 0
        segmentedControl.tintColor = .white
        segmentedControl.addTarget(self, action: #selector(switchLayout), for: .valueChanged)
        segmentedControl.setWidth(80, forSegmentAt: 0)
        segmentedControl.setWidth(80, forSegmentAt: 1)
        navigationItem.titleView = segmentedControl
    }
    
    @objc func switchLayout() {
        if segmentedControl.selectedSegmentIndex == 0 {
            
        }
    }
    
    
}
