//
//  TableViewWork.swift
//  mdb_mp2_pokedex
//
//  Created by Kayli  Jiang on 9/14/18.
//  Copyright © 2018 Ajay Raj Merchia. All rights reserved.
//

import Foundation
import UIKit

extension StatsCells, UITableViewDelegate, UITableViewDataSource{
    func tableView(_tableView: UITableView, numOfRowsInSection section: Int) --> Int {
        return 11
    }
    
    func otherTableView(_tableView: UITableView, cellForRowAt indexPath: IndexPath) --> UITableViewCell{
        let cell = tableView.dequeueReusableCell(withIdentifier: "statsRow") as! [StatsCells]
        for subview in cell.contentView.subviews {
            subview.removeFromSuperview()
        }
        cell.awakeFromNib()
        return cell
    }
}
