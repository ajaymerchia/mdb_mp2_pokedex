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
    @objc func set_filter_button_state(sender: FilterButton) {
        sender.isSelected = !sender.isSelected
        
        if sender.isSelected {
            activate_filter(sender)
        } else {
            deactivate_filter(sender)
        }

        
    }
    
    func activate_filter(_ sender: FilterButton) {
        let sender_label = Pokemon.ALL_POKE_FILTERS[sender.tag]

        if sender.isValueFilter {
            getMinimumValue(sender_label)
            
        } else {
            selected_filters.append(SearchFilter.create_type_filter(type: sender_label))
        }
    }
    
    func deactivate_filter(_ sender: FilterButton) {
        
        var remove_me:Int?
        for i in 0..<selected_filters.count {
            if selected_filters[i] == Pokemon.ALL_POKE_FILTERS[sender.tag] {
                remove_me = i
            }
        }
        guard let remove = remove_me else {
            return
        }
        selected_filters.remove(at: remove)
    }
    
    func getMinimumValue(_ attribute: String) {
        let minimum_prompter = UIAlertController(title: "Set Minimum " + attribute + " Points", message: nil, preferredStyle: .alert)
        
        minimum_prompter.addTextField(configurationHandler: { textField in
            textField.placeholder = "Enter Minimum"
        })
        
        minimum_prompter.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: {
            action in
            self.deselect(attribute)
        }))
        minimum_prompter.addAction(UIAlertAction(title: "Confirm", style: .default, handler: { action in
            
            let response = Int((minimum_prompter.textFields?.first?.text)!)!
        
            if response < 0 || response > 200 {
                self.deselect(attribute)
                self.badPokemonAttrRange()
                return
            }
            
            self.getCellWith(type: attribute)?.points_selected.text = "\(response) - 200"
            self.addValueFilter(sender_label: attribute.lowercased(), minVal: response)
        }))
        

        self.present(minimum_prompter, animated: true)

    }
    
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
    
    
    func badPokemonAttrRange() {
        let alert = UIAlertController(title: "Oops", message: "Pokemon stats are only between 0 and 200, please adjust your entry.", preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "Got it, Coach!", style: UIAlertActionStyle.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    func deselect(_ _attribute: String) {
        getButtonWith(type: _attribute)?.isSelected = false
    }
    
    func getButtonWith(type: String) -> FilterButton? {
        return getCellWith(type: type)?.filterImageButton
    }
    
    func getCellWith(type: String) -> FilterCellView? {
        guard let cellIndex = Pokemon.ALL_POKE_FILTERS.index(of: type) else {
            return nil
        }
        return filter_collection[cellIndex]
    }
    
    
}
