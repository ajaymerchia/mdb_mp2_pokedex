//
//  Profile-stats.swift
//
//
//  Created by Ajay Raj Merchia on 9/14/18.
//

import Foundation
import UIKit

extension ProfileViewController: UITableViewDelegate, UITableViewDataSource {
    
    
    /// Establishes number of cells to do
    ///
    /// - Parameters:
    ///   - tableView: <#tableView description#>
    ///   - section: <#section description#>
    /// - Returns: <#return value description#>
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Pokemon.statNames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "statsRow") as! StatsCells
        
        for subview in cell.contentView.subviews {
            subview.removeFromSuperview()
        }
        cell.awakeFromNib()
        cell.stat_label.text = Pokemon.statNames[indexPath.row] + ": \(pokemonProfile.stats[indexPath.row])"
        cell.stat_logo.image = UIImage(named: Pokemon.statNames[indexPath.row].lowercased().replacingOccurrences(of: " ", with: "_"))
        cell.selectionStyle = UITableViewCellSelectionStyle.none
        return cell
    }
}
