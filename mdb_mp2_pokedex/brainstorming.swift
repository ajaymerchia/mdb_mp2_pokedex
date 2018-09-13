//
//  brainstorming.swift
//  mdb_mp2_pokedex
//
//  Created by Ajay Raj Merchia on 9/11/18.
//  Copyright © 2018 Ajay Raj Merchia. All rights reserved.
//

import Foundation
import UIKit
extension WelcomeViewController {
    func manual_tableview() {
        let total_filters = Pokemon.ALL_POKE_FILTERS.count
        
        let total_row = 7
        let total_col = 3
        
        let upper_bound_of_filters = view.frame.height/6 + 100
        
        let vertical_space = view.frame.height - upper_bound_of_filters - 0
        
        let labelWidth = WORKING_SPACE/CGFloat(total_col)
        let labelHeight = vertical_space/CGFloat(total_row)
        
        for i in 0..<total_filters {
            let r = CGFloat(Int(i / total_col))
            let c = CGFloat(Int(i % total_col))
            
            
            
            let x_center = view.frame.width * (1+c)/4
            let y_center = upper_bound_of_filters + (vertical_space/CGFloat(total_row) * r)
            
            let curr_label = UILabel(frame: CGRect(x: x_center - labelWidth/2, y: y_center - labelHeight/2, width: labelWidth, height: labelHeight))
            
            curr_label.text = Pokemon.ALL_POKE_FILTERS[i]
            //            app_title.font = UIFont(name: "NaughtySquirrelShadowedDemo", size: 60)
            curr_label.lineBreakMode = NSLineBreakMode.byWordWrapping
            curr_label.numberOfLines = 2
            curr_label.textColor = .black
            curr_label.textAlignment = .center
            filter_labels.append(curr_label)
            view.addSubview(curr_label)
        }
        
    }

}
