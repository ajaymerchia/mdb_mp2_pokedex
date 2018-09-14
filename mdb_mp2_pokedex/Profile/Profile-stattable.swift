//
//  TableViewWork.swift
//  mdb_mp2_pokedex
//
//  Created by Kayli  Jiang on 9/14/18.
//  Copyright © 2018 Ajay Raj Merchia. All rights reserved.
//

import Foundation
import UIKit

extension ProfileViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 11
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "statsRow") as! StatsCells
        
        for subview in cell.contentView.subviews {
            subview.removeFromSuperview()
        }
        cell.awakeFromNib()
        cell.stat_label.text = "hello"
        cell.stat_logo.image = #imageLiteral(resourceName: "pokeball")
        
        return cell
    }
}
