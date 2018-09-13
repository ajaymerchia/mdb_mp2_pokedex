//
//  WelcomeViewController.swift
//  mdb_mp2_pokedex
//
//  Created by Ajay Raj Merchia on 9/9/18.
//  Copyright © 2018 Ajay Raj Merchia. All rights reserved.
//

import UIKit

class WelcomeViewController: UIViewController {
    
    // UIComponents for Header
    var header_img: UIImageView!
    
    // UIComponents for SelectingFilters
    var filter_labels: [UILabel] = []
    var filterCollectionView: UICollectionView!
    
    // UIComponents for Miscellaneous/Events
    
    // UISpacing Components
    let PADDING:CGFloat = 20
    var WORKING_SPACE:CGFloat!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        WORKING_SPACE = view.frame.width - 2 * PADDING
        
        //Initialize UI Components
        init_img()
        init_buttons()
        init_text()
        init_grid()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = false
    }
    
    

}

