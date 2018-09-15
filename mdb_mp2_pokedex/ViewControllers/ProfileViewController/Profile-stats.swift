//
//  Profile-stats.swift
//
//
//  Created by Ajay Raj Merchia on 9/14/18.
//

import Foundation
import UIKit

extension ProfileViewController: UITableViewDelegate, UITableViewDataSource {
    
    
    /// Establishes number of cells to create stats for
    ///
    /// - Parameters:
    ///   - tableView: tableview holding these cells
    ///   - section: numrows indentifier
    /// - Returns: Number of rows to create
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Pokemon.statNames.count
    }
    
    
    /// Pattern for initialzing and creating the stats cells
    ///
    /// - Parameters:
    ///   - tableView: TableView to which to add the cell
    ///   - indexPath: index of the Cell
    /// - Returns: cell containing the stats at indexPath
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // clean-up cell
        let cell = tableView.dequeueReusableCell(withIdentifier: "statsRow") as! StatsCells
        for subview in cell.contentView.subviews {
            subview.removeFromSuperview()
        }
        
        // Initialize Cell Data
        cell.awakeFromNib()
        cell.stat_label.text = Pokemon.statNames[indexPath.row] + ": \(pokemonProfile.stats[indexPath.row])"
        cell.stat_logo.image = UIImage(named: Pokemon.statNames[indexPath.row].lowercased().replacingOccurrences(of: " ", with: "_"))
        
        return cell
    }
}
