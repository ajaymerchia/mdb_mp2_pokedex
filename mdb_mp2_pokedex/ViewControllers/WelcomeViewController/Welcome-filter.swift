//
//  WelcomeViewController-searchlogic.swift
//  mdb_mp2_pokedex
//
//  Created by Ajay Raj Merchia on 9/12/18.
//  Copyright © 2018 Ajay Raj Merchia. All rights reserved.
//

import Foundation
import UIKit

extension WelcomeViewController {
    
    /// Ensures that the shown filter represents the stored filter objects
    @objc func set_filter_button_state(sender: FilterButton) {
        if let ind = index_of_selected_filters.index(of: sender.tag) {
            index_of_selected_filters.remove(at: ind)
            sender.isSelected = false
        } else {
            index_of_selected_filters.append(sender.tag)
            sender.isSelected = true
        }
        
        if index_of_selected_filters.contains(sender.tag) {
            activate_filter(sender)
        } else {
            deactivate_filter(sender)
        }

        
    }
    
    /// Activates the filter associated with sender
    ///
    /// - Parameter sender: filter source
    func activate_filter(_ sender: FilterButton) {
        let sender_label = Pokemon.ALL_POKE_FILTERS[sender.tag]

        if sender.isValueFilter {
            getMinimumValue(sender_label)
        } else {
            selected_filters.append(SearchFilter.create_type_filter(type: sender_label))
        }
    }
    
    /// Deactivates the filter associated with sender
    ///
    /// - Parameter sender: filter source
    func deactivate_filter(_ sender: FilterButton) {
        
        var remove_me:Int?
        for i in 0..<selected_filters.count {
            if selected_filters[i].generic_repr() == Pokemon.ALL_POKE_FILTERS[sender.tag].lowercased() {
                remove_me = i
            }
        }
        guard let remove = remove_me else {
            return
        }
        if sender.isValueFilter {
            filter_collection[sender.tag].points_selected.text = "0-200"
        }
        selected_filters.remove(at: remove)
    }
    
    
    /// Gets the value via an alert screen
    ///
    /// - Parameter attribute: Gets the lower bound on the stat
    func getMinimumValue(_ attribute: String) {
        let minimum_prompter = UIAlertController(title: "Set Minimum " + attribute + " Points", message: nil, preferredStyle: .alert)
        
        minimum_prompter.addTextField(configurationHandler: { textField in
            textField.placeholder = "Enter Minimum"
        })
        
        minimum_prompter.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: {
            action in
            self.deselectCellWith(attribute: attribute)
        }))
        minimum_prompter.addAction(UIAlertAction(title: "Confirm", style: .default, handler: { action in
            
            guard let response = Int((minimum_prompter.textFields?.first?.text)!) else {
                self.deselect(attribute)
                self.deselectCellWith(attribute: attribute)
                self.badPokemonAttrRange()
                return
            }
        
            if response < 0 || response > 200 {
                self.deselect(attribute)
                self.deselectCellWith(attribute: attribute)
                self.badPokemonAttrRange()
                return
            }
            
            self.updateTextOfCellWith(attribute: attribute, to: response)
            self.addValueFilter(sender_label: attribute.lowercased(), minVal: response)
        }))
        

        self.present(minimum_prompter, animated: true)

    }
    
    
    /// Adds a Value-based filter to the search queries
    ///
    /// - Parameters:
    ///   - sender_label: label of the filter
    ///   - minVal: value of the filter
    func addValueFilter(sender_label: String, minVal: Int) {
        switch sender_label {
        case "attack":
            let filter = SearchFilter.create_attk_filter(min: minVal)
            selected_filters.append(filter)
        case "defense":
            let filter = SearchFilter.create_dfns_filter(min: minVal)
            selected_filters.append(filter)
        case "hp":
            let filter = SearchFilter.create_hlth_filter(min: minVal)
            selected_filters.append(filter)
        default:
            debugPrint("error occurred with identifying filter button")
        }
    }
    
    
    /// Handles bad input from user
    func badPokemonAttrRange() {
        let alert = UIAlertController(title: "Oops", message: "Pokemon stats are only between 0 and 200, please adjust your entry.", preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "Got it, Coach!", style: UIAlertActionStyle.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    
    /// Deselects the cell
    ///
    /// - Parameter _attribute: cell filter to deselect
    func deselect(_ _attribute: String) {
        if let button = getButtonWith(type: _attribute) {
            button.isSelected = false
            if let ind = index_of_selected_filters.index(of: button.tag) {
                index_of_selected_filters.remove(at: ind)
            }
        }
    }
    
    /// More reliable universal deselect
    ///
    /// - Parameter _attribute: cell filter to deselect
    func deselectCellWith(attribute: String) {
        for cell in filter_collection {
            if cell.name_of_filter == attribute.lowercased() {
                cell.filterImageButton.isSelected = false
            }
        }
    }
    
    
    /// Returns a button associated with the TYPE
    ///
    /// - Parameter type: type of Filter
    /// - Returns: Button pertaining to filter
    func getButtonWith(type: String) -> FilterButton? {
        return getCellWith(type: type)?.filterImageButton
    }
    
    /// Returns a cell associated with the TYPE
    ///
    /// - Parameter type: type of Filter
    /// - Returns: Cell pertaining to filter
    func getCellWith(type: String) -> FilterCellView? {
        guard let cellIndex = Pokemon.ALL_POKE_FILTERS.index(of: type) else {
            return nil
        }
        return filter_collection[cellIndex]
    }
    
    
    /// Updates the String at the Text
    ///
    /// - Parameters:
    ///   - attribute: filter to change
    ///   - to: new text
    func updateTextOfCellWith(attribute: String, to: Int) {
        for cell in filter_collection {
            if cell.name_of_filter == attribute.lowercased() {
                cell.points_selected.text = "\(to) - 200"
            }
        }
    }
    
    
}
