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
        debugPrint(sender.tag, Pokemon.ALL_POKE_FILTERS[sender.tag])
        
        if sender.isSelected {
            activate_filter(sender)
        } else {
            deactivate_filter(sender)
        }
        debugPrint(selected_filters)

        
        if sender.isValueFilter {
            debugPrint("this is a value button")
        }
        
    }
    
    func activate_filter(_ sender: FilterButton) {
        if sender.isValueFilter {
            let minVal = getMinimumValue()
            switch Pokemon.ALL_POKE_FILTERS[sender.tag].lowercased() {
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
            
        } else {
            selected_filters.append(SearchFilter.create_type_filter(type: Pokemon.ALL_POKE_FILTERS[sender.tag]))
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
    
    func getMinimumValue() -> Int {
        return 30
    }
    
    
    
    
}
