 //
//  StatsCells.swift
//  mdb_mp2_pokedex
//
//  Created by Kayli  Jiang on 9/14/18.
//  Copyright © 2018 Ajay Raj Merchia. All rights reserved.
//

import Foundation
import UIKit
 
 class StatsCells: UITableView {
    var label: UILabel!
    var view: UIImageView!
    
    func loadStatsTable(){
        let PADDING: CGFloat = 20
        let WORKING_SPACE = view.frame.width - 2 * PADDING
        let UIComponentAbove = webSearchButton.frame.max.Y
        statsTable = UITableView(frame: CGRect(x:PADDING, y:UIComponentAbove, width: WORKING_SPACE, height: view.frame.height - UIComponentAbove.maxY-PADDING))
        statsTable.register(StatsCells.self, forCellReuseIdentifier: "statsRow")
        statsTable.delegate = self
        statsTable.rowHeight = height_of_row
        view.addSubView(statsTable)
        
    }

 }
