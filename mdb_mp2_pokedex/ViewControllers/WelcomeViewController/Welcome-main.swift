//
//  WelcomeViewController.swift
//  mdb_mp2_pokedex
//
//  Created by Ajay Raj Merchia on 9/9/18.
//  Copyright © 2018 Ajay Raj Merchia. All rights reserved.
//

import UIKit

class WelcomeViewController: UIViewController, UISearchBarDelegate {
    
    // Components and Logic for Search
    var searchBar: UISearchBar!
    var searchText: String!
    
    //Favorites icon
    let favoritesIcon = UIImage(named: "favorites")
    
    // UIComponents for Header
    var header_img: UIImageView!
    var header_txt: UILabel!
    
    // UIComponents for SelectingFilters
    var filter_buttons: [FilterButton] = []
    var filter_collection: [FilterCellView] = []
    var filterCollectionView: UICollectionView!
    
    // UIComponents for Events
    var filteredSearch: UIButton!
    var randomizedSearch: UIButton!
    
    // UISpacing Components
    let PADDING:CGFloat = 20
    var WORKING_SPACE:CGFloat!
    
    // Search Logic Components
    var selected_filters: [SearchFilter] = []
    var index_of_selected_filters: [Int] = []
    var qualifiedPokemon: [Pokemon] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        WORKING_SPACE = view.frame.width - 2 * PADDING
        //Initialize UI Components
        init_nav()
        init_img()
        init_text()
        init_buttons()
        init_grid()
        init_background()
        init_search()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = false
    }
    
    

}

