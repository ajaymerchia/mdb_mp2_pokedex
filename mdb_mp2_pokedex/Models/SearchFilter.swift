//
//  SearchFilter.swift
//  This class abstracts filtering logic away from users for the Pokemon object. Accesses releveant parameters and determines whether or not the pokemon satisfies the condition. Usage abstracted away to static initializer functions
//  mdb_mp2_pokedex
//
//  Created by Ajay Raj Merchia on 9/13/18.
//  Copyright © 2018 Ajay Raj Merchia. All rights reserved.
//

import Foundation

class SearchFilter: Equatable {
    
    /// The different types of filters that can exist.
    ///
    /// - NAME_EQUALS: Type for checking if substring in pokemon
    /// - NUM_EQUALS: Type for checking if pokemon id_number matches
    /// - TYPE_EQUALS: Type for checking if the pokemen has a certain type
    /// - INT_GREATER_THAN: for checking if stats exceed certain requirements
    enum FILTER_TYPE {
        case NAME_EQUALS
        case NUM_EQUALS
        case TYPE_EQUALS
        case INT_GREATER_THAN
    }
    
    
    /// Numberically adjustable Stats
    enum STATS {
        case ATTACK
        case DEFENSE
        case HP
    }
    
    
    /// Filtering types
    var filterType: FILTER_TYPE?
    var statType: STATS?
    
    
    /// Values to compare to
    var int_comparee: Int?
    var str_comparee: String?
    
    
    /// Constructor for comparison purposes (internal)
    ///
    /// - Parameter _filterType: comparison type
    private init(_ _filterType: FILTER_TYPE) {
        filterType = _filterType
    }
    
    
    /// Constructor for string based filters
    ///
    /// - Parameter _comparee: string to compare to
    init(_ _comparee: String) {
        filterType = FILTER_TYPE.NAME_EQUALS
        str_comparee = _comparee
    }
    
    
    /// Constructor for int based filters
    ///
    /// - Parameter _comparee: Int to compare to
    init(_ _comparee: Int) {
        filterType = FILTER_TYPE.INT_GREATER_THAN
        int_comparee = _comparee
    }
    
    
    /// Comparators for external equivalencies
    static public let NAME_EQ  = SearchFilter(FILTER_TYPE.NAME_EQUALS)
    static public let NUM_EQ   = SearchFilter(FILTER_TYPE.NUM_EQUALS)
    static public let TYPE_EQ  = SearchFilter(FILTER_TYPE.TYPE_EQUALS)
    static public let STAT_GR  = SearchFilter(FILTER_TYPE.INT_GREATER_THAN)
    
    
    /// Equator Method Overrides
    static func == (lhs: SearchFilter, rhs: SearchFilter) -> Bool {
        return lhs.generic_repr() == rhs.generic_repr()
    }
    
    static func == (lhs: SearchFilter, rhs: String) -> Bool {
        return lhs.generic_repr() == rhs
    }
    
    static func == (lhs: String, rhs: SearchFilter) -> Bool {
        return lhs == rhs.generic_repr()
    }
    
    
    
    /// Returns a string based representation of this filter
    ///
    /// - Returns: String based repr of this filter
    func generic_repr() -> String {
        guard let filter = filterType else {
            return ""
        }
        switch filter {
        case .NAME_EQUALS:
            return "name"
        case .NUM_EQUALS:
            return "number"
        case .TYPE_EQUALS:
            return str_comparee!
        case .INT_GREATER_THAN:
            guard let type = statType else {
                return ""
            }
            switch type {
            case .ATTACK:
                return "attack"
            case .DEFENSE:
                return "defense"
            case .HP:
                return "hp"
            }
        }
    }
    
    
    /// Determines if pokemon satifies this filter
    ///
    /// - Parameter x: Pokemon to test against
    /// - Returns: Whether or not the pokemon satisfies conditions
    public func pred(x: Pokemon) -> Bool {

        switch filterType! {
        case .NAME_EQUALS:
            return x.name.lowercased().contains(str_comparee!.lowercased())
        case .NUM_EQUALS:
            return x.number == int_comparee!
        case .TYPE_EQUALS:
            return x.types.contains(str_comparee!)
        case .INT_GREATER_THAN:
            guard let type = statType else {
                return false
            }
            guard let val = int_comparee else {
                return false
            }
            switch type {
            case .ATTACK:
                return x.attack > val
            case .DEFENSE:
                return x.defense > val
            case .HP:
                return x.health > val
            }
            
        }
    }
    
    
    /// PUBLIC CONSTRUCTOR METHODS
    static func create_name_filter (name: String) -> SearchFilter {
        let filter = SearchFilter(name)
        filter.filterType = FILTER_TYPE.NAME_EQUALS
        return filter
    }
    static func create_numb_filter (number: Int) -> SearchFilter {
        let filter = SearchFilter(number)
        filter.filterType = FILTER_TYPE.NUM_EQUALS
        return filter
    }
    static func create_type_filter (type: String) -> SearchFilter {
        let filter = SearchFilter(type)
        filter.filterType = FILTER_TYPE.TYPE_EQUALS
        return filter
    }
    static func create_attk_filter (min: Int) -> SearchFilter {
        let filter = SearchFilter(min)
        filter.filterType = FILTER_TYPE.INT_GREATER_THAN
        filter.statType = STATS.ATTACK
        return filter
    }
    static func create_dfns_filter (min: Int) -> SearchFilter {
        let filter = SearchFilter(min)
        filter.filterType = FILTER_TYPE.INT_GREATER_THAN
        filter.statType = STATS.DEFENSE
        return filter
    }
    static func create_hlth_filter (min: Int) -> SearchFilter {
        let filter = SearchFilter(min)
        filter.filterType = FILTER_TYPE.INT_GREATER_THAN
        filter.statType = STATS.HP
        return filter
    }
    
    
}
